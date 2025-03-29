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

def first_attempt_at_fine_tuning(api_key=None):
    if api_key is None:
        assert False, "API key is required for OpenAI client initialization."
    start_date = datetime.now() - timedelta(days=365)
    end_date = start_date + timedelta(days=2)

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

    with open(training_filename, "rb") as file:
        file_response = client.files.create(
            file=file,
            purpose="fine-tune"  # Changed from "fine-tuning" to "fine-tune"
        )
    
    training_file_id = file_response.id
    print(f"Uploaded training file. File ID: {training_file_id}")
    
    fine_tune_response = client.fine_tuning.jobs.create(
        training_file=training_file_id,
        model="gpt-4o-2024-08-06"
    )
    
    print("Fine-tune job created:")
    print(fine_tune_response)

    job_id = fine_tune_response.id
    print("Waiting for fine-tuning to complete...")
    status = "running"
    while status in ["running", "created", "pending"]:
        time.sleep(20)  # Check status every minute
        job_info = client.fine_tuning.jobs.retrieve(job_id)
        status = job_info.status
        print(f"Job status: {status}")
        
    if status == "succeeded":
        fine_tuned_model = job_info.fine_tuned_model  # This is the actual model ID
        return fine_tuned_model, api_key
    else:
        print(f"Fine-tuning failed with status: {status}")
        return None, api_key
    
if __name__ == "__main__":
    api_key = os.getenv("OPENAI_API_KEY")
    model_id = first_attempt_at_fine_tuning(api_key=api_key)
    print()