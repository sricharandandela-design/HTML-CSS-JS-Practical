from pathlib import Path
from html import escape
import re

# ============================================================
# JAVASCRIPT PRACTICAL PROGRAM INDEX GENERATOR
# ============================================================

JS_FOLDER = Path(__file__).parent

# Program file types that should appear in the website
PROGRAM_EXTENSIONS = {
    ".html",
    ".sql",
    ".js"
}


# ============================================================
# CSS STYLE
# ============================================================

STYLE = """
<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: Arial, sans-serif;
    background: #f4f7fb;
    color: #222;
}

header {
    background: #172033;
    color: white;
    text-align: center;
    padding: 45px 20px;
}

header h1 {
    font-size: 36px;
    margin-bottom: 10px;
}

header p {
    font-size: 18px;
    color: #d1d5db;
}

.container {
    max-width: 1100px;
    margin: 40px auto;
    padding: 20px;
}

.card {
    background: white;
    padding: 25px;
    margin-bottom: 20px;
    border-radius: 15px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.08);
}

.card h2 {
    color: #2563eb;
    margin-bottom: 12px;
}

.card p {
    color: #666;
    line-height: 1.6;
    margin-bottom: 15px;
}

.btn {
    display: inline-block;
    background: #2563eb;
    color: white;
    text-decoration: none;
    padding: 11px 18px;
    border-radius: 8px;
    font-weight: bold;
}

.btn:hover {
    background: #1d4ed8;
}

.program {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;
    padding: 15px;
    margin-bottom: 10px;
    background: #f8fafc;
    border: 1px solid #e5e7eb;
    border-radius: 10px;
}

.program-name {
    font-weight: bold;
    word-break: break-word;
}

.open-btn {
    background: #2563eb;
    color: white;
    text-decoration: none;
    padding: 9px 16px;
    border-radius: 7px;
    white-space: nowrap;
}

.open-btn:hover {
    background: #1d4ed8;
}

.home {
    text-align: center;
    margin-top: 30px;
}

.home a {
    color: #2563eb;
    text-decoration: none;
    font-weight: bold;
}

.folder-box {
    background: #f8fafc;
    border: 1px solid #e5e7eb;
    padding: 18px;
    margin-bottom: 12px;
    border-radius: 10px;
}

.folder-box h3 {
    color: #172033;
    margin-bottom: 8px;
}

.file-type {
    display: inline-block;
    margin-left: 8px;
    padding: 3px 7px;
    border-radius: 5px;
    background: #e5e7eb;
    font-size: 12px;
    color: #444;
}

@media (max-width: 650px) {

    .program {
        flex-direction: column;
        align-items: flex-start;
    }

    .open-btn {
        width: 100%;
        text-align: center;
    }

    header h1 {
        font-size: 28px;
    }
}

</style>
"""


# ============================================================
# HELPER FUNCTIONS
# ============================================================

def program_files(folder):
    """
    Return program files directly inside a folder.
    """

    files = []

    for file in folder.iterdir():

        if file.is_file() and file.suffix.lower() in PROGRAM_EXTENSIONS:
            files.append(file)

    return sorted(files, key=natural_sort_key)


def subfolders(folder):
    """
    Return folders directly inside a folder.
    """

    return sorted(
        [
            item for item in folder.iterdir()
            if item.is_dir() and not item.name.startswith(".")
        ],
        key=lambda x: x.name.lower()
    )


def natural_sort_key(path):
    """
    Sort files naturally:
    1, 2, 3, 10, 11
    instead of:
    1, 10, 11, 2, 3
    """

    parts = re.split(r"(\d+)", path.stem.lower())

    result = []

    for part in parts:

        if part.isdigit():
            result.append(int(part))
        else:
            result.append(part)

    return result


def display_name(name):
    """
    Convert file/folder names into readable titles.
    """

    name = name.replace("_", " ")
    name = name.replace("-", " ")

    return name.title()


def count_programs(folder):
    """
    Count all .html and .sql files recursively.
    """

    total = 0

    for item in folder.rglob("*"):

        if item.is_file() and item.suffix.lower() in PROGRAM_EXTENSIONS:

            # Don't count generated index.html files
            if item.name.lower() == "index.html":
                continue

            total += 1

    return total


# ============================================================
# CREATE INDEX FOR EVERY DIRECTORY
# ============================================================

def create_index(folder):

    direct_files = program_files(folder)
    folders = subfolders(folder)

    sections = ""


    # --------------------------------------------------------
    # SHOW SUBFOLDERS
    # --------------------------------------------------------

    for subfolder in folders:

        total = count_programs(subfolder)

        sections += f"""
        <div class="folder-box">

            <h3>
                📁 {escape(display_name(subfolder.name))}
            </h3>

            <p>
                {total} programs
            </p>

            <a class="btn"
               href="{escape(subfolder.name)}/index.html">

                View Programs

            </a>

        </div>
        """


    # --------------------------------------------------------
    # SHOW DIRECT PROGRAM FILES
    # --------------------------------------------------------

    for number, file in enumerate(direct_files, 1):

        title = display_name(file.stem)

        extension = file.suffix.upper()

        sections += f"""
        <div class="program">

            <span class="program-name">

                {number}. {escape(title)}

                <span class="file-type">
                    {escape(extension)}
                </span>

            </span>

            <a class="open-btn"
               href="{escape(file.name)}">

                Open

            </a>

        </div>
        """


    total_programs = count_programs(folder)

    folder_title = display_name(folder.name)


    # --------------------------------------------------------
    # BACK LINK
    # --------------------------------------------------------

    if folder == JS_FOLDER:

        back_link = "../index.html"
        back_text = "← Back to Home"

    else:

        back_link = "../index.html"
        back_text = "← Back to Parent"


    # --------------------------------------------------------
    # HTML PAGE
    # --------------------------------------------------------

    html = f"""<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>{escape(folder_title)} - JavaScript Programs</title>

    {STYLE}

</head>

<body>


<header>

    <h1>{escape(folder_title)}</h1>

    <p>
        JavaScript Practical Programs
    </p>

</header>


<div class="container">


    <div class="card">

        <h2>
            {total_programs} Programs
        </h2>

        <p>
            Select a program or topic below.
        </p>

    </div>


    <div class="card">

        <h2>
            Program List
        </h2>

        {sections}

    </div>


    <div class="home">

        <a href="{escape(back_link)}">
            {escape(back_text)}
        </a>

    </div>


</div>


</body>

</html>
"""


    index_file = folder / "index.html"

    index_file.write_text(
        html,
        encoding="utf-8"
    )


# ============================================================
# CREATE INDEXES RECURSIVELY
# ============================================================

directories = [
    JS_FOLDER
]

for directory in JS_FOLDER.rglob("*"):

    if directory.is_dir() and not directory.name.startswith("."):

        directories.append(directory)


for directory in directories:

    create_index(directory)


# ============================================================
# MAIN JAVASCRIPT INDEX
# ============================================================

main_sections = ""

top_level_folders = subfolders(JS_FOLDER)

for folder in top_level_folders:

    total = count_programs(folder)

    main_sections += f"""
    <div class="card">

        <h2>
            {escape(display_name(folder.name))}
        </h2>

        <p>
            {total} programs
        </p>

        <a class="btn"
           href="{escape(folder.name)}/index.html">

            View Programs

        </a>

    </div>
    """


total_programs = count_programs(JS_FOLDER)

total_folders = len(top_level_folders)


main_html = f"""<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>JavaScript Practical Programs</title>

    {STYLE}

</head>

<body>


<header>

    <h1>
        JavaScript Practical Programs
    </h1>

    <p>
        HTML, CSS & JavaScript Practical Assignment
    </p>

</header>


<div class="container">


    <div class="card">

        <h2>
            JavaScript Programs
        </h2>

        <p>
            Explore all JavaScript practical programs
            organized according to their respective topics.
        </p>

        <p>

            <strong>
                {total_folders} folders
                •
                {total_programs} programs
            </strong>

        </p>

    </div>


    {main_sections}


    <div class="home">

        <a href="../index.html">

            ← Back to Home

        </a>

    </div>


</div>


</body>

</html>
"""


main_index = JS_FOLDER / "index.html"

main_index.write_text(
    main_html,
    encoding="utf-8"
)


# ============================================================
# FINAL RESULT
# ============================================================

print()
print("==========================================")
print("JavaScript index generation complete!")
print("==========================================")
print(f"Main folders : {total_folders}")
print(f"Total programs : {total_programs}")
print("HTML files and SQL files included.")
print("Nested folders included.")
print("==========================================")