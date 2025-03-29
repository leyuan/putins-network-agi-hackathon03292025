from openai import OpenAI
from fine_tune import fine_tune
import os

def interact_with_model(model_id=None, api_key=None):
    client = OpenAI(api_key=api_key)
    
    if model_id is None:
        model = "gpt-4o-2024-08-06"  # Default model
        print(f"Using default model: {model}")
    else:
        model = model_id
        print(f"Using fine-tuned model: {model}")
    
    print("\nEnter your questions below. Type 'exit', 'quit', or 'q' to end the session.")
    print("Type 'clear' to start a new conversation.\n")
    
    # Initialize conversation history
    messages = [
        {"role": "system", "content": "You are a helpful assistant."}
    ]
    
    # Main interaction loop
    while True:
        # Get user input
        user_input = input("\n> ")
        
        # Check for exit commands
        if user_input.lower() in ['exit', 'quit', 'q']:
            print("Ending session. Goodbye!")
            break
        
        # Check for clear command
        if user_input.lower() == 'clear':
            messages = [{"role": "system", "content": "You are a helpful assistant."}]
            print("Conversation history cleared.")
            continue
        
        # Add user message to history
        messages.append({"role": "user", "content": user_input})
        
        try:
            # Get response from the model
            response = client.chat.completions.create(
                model=model,
                messages=messages,
                temperature=0.7,
            )
            
            # Extract and print the assistant's response
            assistant_response = response.choices[0].message.content
            print(f"\n{assistant_response}")
            
            # Add assistant response to conversation history
            messages.append({"role": "assistant", "content": assistant_response})
            
        except Exception as e:
            print(f"Error: {e}")

if __name__ == "__main__":
    api_key = "your_api_key_here"
    model_id, api_key = fine_tune(api_key=api_key)
    interact_with_model(model_id=model_id, api_key=api_key)
    print()