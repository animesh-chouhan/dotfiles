#!/usr/bin/python3

import os

def query_yes_no(question):
    valid = {"yes": True, "y": True, "no": False, "n": False}
    prompt = " [yes/no] "

    while True:
        print(question + prompt, end="")
        choice = input().lower()
        if choice in valid:
            return valid[choice]
        else:
            print("Please respond with 'yes' or 'no' (or 'y' or 'n').")

def get_dotfiles(directory):
    dotfiles = {}

    for root, dirs, files in os.walk(directory):
        for filename in files:
            if filename[0] == '.':
                print(filename)
                filepath = os.path.join(root, filename)
                dotfiles[filename] = filepath

    return dotfiles

def create_hardlinks(dotfiles_paths):
    home = os.path.expanduser("~")
    for file in dotfiles_paths.keys():
        os.link(dotfiles_paths[file], f"{home}/{file}")


print(f"Home directory: ", os.path.expanduser("~"))
print("Found dotfiles: ")
dotfiles = get_dotfiles(os.getcwd())

flag = query_yes_no("Is this info correct?")
if flag == True:
    create_hardlinks(dotfiles)
    print("Done Installing.")
else:
    print("Exited.")
