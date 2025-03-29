from download_isw import download_isw_main
from openai import OpenAI
import json
import os
from datetime import datetime, timedelta
import time

def cancel_previous_jobs(client):
    jobs = client.fine_tuning.jobs.list()

    for job in jobs.data:
        if job.status == "pending":
            print(f"Cancelling job: {job.id}")
            client.fine_tuning.jobs.cancel(job.id)
            print(f"Job {job.id} cancelled")

    return

def fine_tune(api_key=None):
    if api_key is None:
        assert False, "API key is required for OpenAI client initialization."
    
    try:
        if api_key is None:
            assert False, "API key is required for OpenAI client initialization."
        start_date = datetime.now() - timedelta(days=365)
        end_date = start_date + timedelta(days=9)

        isw_texts, source_links_by_day = download_isw_main(start_date.strftime("%Y-%m-%d"), end_date.strftime("%Y-%m-%d"))
        
        training_data = [{"messages": [{"role": "system", "content": "You are a helpful assistant."}, {"role": "user", "content": ""}, {"role": "assistant", "content": text}]} for text in isw_texts]
        
        training_filename = "training_data.jsonl"
        with open(training_filename, "w") as f:
            for entry in training_data:
                json.dump(entry, f)
                f.write("\n")
        
        print(f"Training data written to {training_filename}")
        
        client = OpenAI(api_key=api_key)
        cancel_previous_jobs(client)
        
        try:
            with open(training_filename, "rb") as file:
                file_response = client.files.create(
                    file=file,
                    purpose="fine-tune"
                )
            training_file_id = file_response.id
            print(f"Uploaded training file. File ID: {training_file_id}")
        except Exception as e:
            print(f"Error uploading file: {str(e)}")
            return None, api_key
        
        try:
            fine_tune_response = client.fine_tuning.jobs.create(
                training_file=training_file_id,
                model="gpt-4o-2024-08-06"
            )
            job_id = fine_tune_response.id
            print(f"Fine-tune job created: {job_id}")
        except Exception as e:
            print(f"Error creating fine-tuning job: {str(e)}")
            return None, api_key
        
        print("Waiting for fine-tuning to complete...")
        status = "running"
        while status not in ["succeeded", "failed", "cancelled"]:
            time.sleep(20)
            
            try:
                job_info = client.fine_tuning.jobs.retrieve(job_id)
                status = job_info.status
                print(f"Job status: {status}")
                
                if hasattr(job_info, 'error') and job_info.error:
                    print(f"Error details: {job_info.error}")
                
                if hasattr(job_info, 'training_metrics') and job_info.training_metrics:
                    print(f"Training metrics: {job_info.training_metrics}")
                    
            except Exception as e:
                print(f"Error checking job status: {str(e)}")
                return None, api_key
        
        if status == "succeeded":
            fine_tuned_model = job_info.fine_tuned_model
            return fine_tuned_model, api_key
        else:
            try:
                full_job_info = client.fine_tuning.jobs.retrieve(job_id)
                print(f"Job failed with status: {status}")
                print(f"Full job information: {full_job_info}")
                
                if hasattr(full_job_info, 'validation_errors'):
                    print(f"Validation errors: {full_job_info.validation_errors}")
                    
                file_info = client.files.retrieve(training_file_id)
                print(f"Training file status: {file_info.status}")
                
            except Exception as e:
                print(f"Error retrieving detailed failure information: {str(e)}")
                
            return None, api_key
            
    except Exception as e:
        print(f"Unexpected error in fine-tuning process: {str(e)}")
        return None, api_key
    
if __name__ == "__main__":
    api_key = os.getenv("OPENAI_API_KEY")
    model_id = fine_tune(api_key=api_key)
    print()