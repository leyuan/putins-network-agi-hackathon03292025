""" 
Given a date string or list of date strings, download the text from the institute for the study of war (ISW) website.
For now, it will be just the russia-ukraine war updates.

Dates should be in this format: march-25-2025
URLs look like this: https://www.understandingwar.org/backgrounder/russian-offensive-campaign-assessment-march-25-2025
"""

"""
Given a date string or list of date strings, download the text from the institute for the study of war (ISW) website.
For now, it will be just the russia-ukraine war updates.

Dates should be in this format: march-25-2025
URLs look like this: https://www.understandingwar.org/backgrounder/russian-offensive-campaign-assessment-march-25-2025
"""

import requests
from bs4 import BeautifulSoup
from datetime import datetime, timedelta
import re
from datetime import datetime, timedelta
import os

def download_isw_text(dates):
    if isinstance(dates, str):
        dates = [dates]
    base_url = "https://www.understandingwar.org/backgrounder/russian-offensive-campaign-assessment-"
    results = {}
    for date in dates:
        url = base_url + date.lower()
        print(f"Fetching URL: {url}")
        try:
            response = requests.get(url)
            response.raise_for_status()
        except requests.RequestException as e:
            print(f"Error fetching {url}: {e}")
            results[date] = None
            continue
        soup = BeautifulSoup(response.text, "html.parser")
        text = soup.get_text(separator="\n", strip=True)
        results[date] = text
    return results

def extract_links_from_text(text):
    results = []
    # Split the input into lines.
    for line in text.splitlines():
        # Match the line with the pattern: a number in brackets followed by any characters.
        m = re.match(r"\[(\d+)\]\s*(.+)", line)
        if m:
            index = m.group(1)
            urls_part = m.group(2)
            # Split on semicolons (which separate multiple URLs).
            raw_urls = [url.strip() for url in urls_part.split(";") if url.strip()]
            # Replace obfuscated " dot " with "."
            cleaned_urls = [re.sub(r"\s*dot\s*", ".", url) for url in raw_urls]
            results.append((index, cleaned_urls))
    return results

def extract_links_for_each_day(texts_dict):
    day_links = {}
    for date, text in texts_dict.items():
        if text:
            day_links[date] = extract_links_from_text(text)
        else:
            day_links[date] = []
    return day_links


def replace_dot_in_links(links_by_day):
    new_links_by_day = {}
    for date, links_tuples in links_by_day.items():
        new_links_tuples = []
        for index, links in links_tuples:
            # Process each URL in the list for this tuple.
            updated_links = [url.replace(" dot ", ".").replace(";", "") for url in links]
            new_links_tuples.append((index, updated_links))
        new_links_by_day[date] = new_links_tuples
    return new_links_by_day

def fetch_dates(start_date, end_date):
    """ 
    Start date and end date should be in the format 'YYYY-MM-DD'.
    Returns a list of dates in the format 'month-day-year' without leading zeros in the day.
    Format: ["march-25-2025", "march-26-2025", ...]
    """
    start = datetime.strptime(start_date, "%Y-%m-%d")
    end = datetime.strptime(end_date, "%Y-%m-%d")
    dates_to_fetch = []
    
    current = start
    while current <= end:
        formatted_date = current.strftime("%B-%d-%Y").lower()
        parts = formatted_date.split("-")
        parts[1] = str(int(parts[1]))  # Remove leading zero from day
        formatted_date = "-".join(parts)
        dates_to_fetch.append(formatted_date)
        current += timedelta(days=1)
    
    return dates_to_fetch

# def download_isw_main(start_date=None, end_date=None):
#     if start_date is None or end_date is None:
#         assert False, "Please provide both start_date and end_date as date time objects."
#     if not isinstance(start_date, str) or not isinstance(end_date, str):
#         assert False, "Please provide both start_date and end_date as strings in the format 'YYYY-MM-DD'."
#     # check that the dates are valid
#     try:
#         datetime.strptime(start_date, "%Y-%m-%d")
#         datetime.strptime(end_date, "%Y-%m-%d")
#     except ValueError:
#         assert False, "Invalid date format. Please use 'YYYY-MM-DD'."
#     # Check that start_date is before end_date
#     if datetime.strptime(start_date, "%Y-%m-%d") >= datetime.strptime(end_date, "%Y-%m-%d"):
#         assert False, "start_date should be before end_date."
#     dates_to_fetch = fetch_dates(start_date, end_date)
#     isw_texts = download_isw_text(dates_to_fetch)
#     links_by_day = extract_links_for_each_day(isw_texts)
#     links_by_day = replace_dot_in_links(links_by_day)
#     return isw_texts, links_by_day

def check_dates(start_date, end_date):
    if start_date is None or end_date is None:
        raise ValueError("Please provide both start_date and end_date as strings in the format 'YYYY-MM-DD'.")
    if not isinstance(start_date, str) or not isinstance(end_date, str):
        raise ValueError("Please provide both start_date and end_date as strings in the format 'YYYY-MM-DD'.")
    
    # Check that the dates are valid and parse them once
    try:
        start_dt = datetime.strptime(start_date, "%Y-%m-%d")
        end_dt = datetime.strptime(end_date, "%Y-%m-%d")
    except ValueError:
        raise ValueError("Invalid date format. Please use 'YYYY-MM-DD'.")
    
    # Check that start_date is before end_date
    if start_dt >= end_dt:
        raise ValueError("start_date should be before end_date.")
    return

import re

def remove_source_links(text_dict):
    """
    For each text string in the dictionary, remove:
    
    1. Any lines that represent source links. A source link is any line that starts with a bracketed number,
       for example: "[1] http://example dot com ; https://another dot com"
       regardless of whether the URLs are obfuscated (using " dot " in place of ".") or multiple links
       are provided separated by semicolons.
    
    2. All text that appears after the marker:
       "Note: ISW does not receive any classified material from any source, uses"
       (i.e. remove the marker and everything following it).
    """
    marker0 = "Note: ISW does not receive any classified material from any source, uses"
    marker1 = "\nTags\nUkraine Project\n"
    marker2 = "\n[1]\nhttp://"
    marker3 = "\n[1]\nhttps://"
    marker4 = "ISW will update this time-lapse map archive monthly."
    # pattern = re.compile(r"^\[\d+\]\s*.+")
    cleaned_dict = {}
    
    for date, text in text_dict.items():
        if text is None:
            cleaned_dict[date] = text
        else:
            if marker0 in text:
                text = text.split(marker0, 1)[0]
            if marker1 in text:
                text = text.split(marker1, 1)[0]
            if marker2 in text:
                text = text.split(marker2, 1)[0]
            if marker3 in text:
                text = text.split(marker3, 1)[0]
            # remove marker4 and everything before it
            if marker4 in text:
                text = text.split(marker4, 1)[1]
            lines = text.splitlines()
            # cleaned_lines = [line for line in lines if not pattern.match(line)]
            # cleaned_dict[date] = "\n".join(cleaned_lines)
            cleaned_dict[date] = "\n".join(lines)
    
    return cleaned_dict

def download_isw_main(start_date=None, end_date=None):
    # Validate and parse the dates
    try:
        check_dates(start_date, end_date)
    except ValueError as e:
        print(e)
        return None, None
    
    dates_to_fetch = fetch_dates(start_date, end_date)
    
    # Assuming these functions are defined elsewhere:
    isw_texts = download_isw_text(dates_to_fetch)
    source_links_by_day = extract_links_for_each_day(isw_texts)
    source_links_by_day = replace_dot_in_links(source_links_by_day)
    isw_texts = remove_source_links(isw_texts)
    return isw_texts, source_links_by_day

def save_to_folder(data, folder_path):
    """ 
    Save each day as date_str_isw_ukraine.txt in the folder.
    """
    os.makedirs(folder_path, exist_ok=True)
    for date, text in data.items():
        if text:
            filename = f"{date}_isw_ukraine.txt"
            filepath = os.path.join(folder_path, filename)
            with open(filepath, "w", encoding="utf-8") as f:
                f.write(text)
            print(f"Saved {filename} to {folder_path}")
        else:
            print(f"No text found for {date}, skipping.")

def test():
    # make the start date 50 days ago and the end date today
    start_date = (datetime.now() - timedelta(days=50)).strftime("%Y-%m-%d")
    end_date = datetime.now().strftime("%Y-%m-%d")
    isw_texts, links_by_day = download_isw_main(start_date, end_date)
    # Save the downloaded texts to a folder
    folder_path = "isw_texts"
    save_to_folder(isw_texts, folder_path)
    print()

if __name__ == "__main__":
    test()
    print("\nDownload complete.")