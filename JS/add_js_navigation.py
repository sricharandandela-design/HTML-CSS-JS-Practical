from pathlib import Path
import re
import os


# JS folder where this Python file is located
js_folder = Path(__file__).parent


def add_navigation(file_path):
    # Do not modify index pages
    if file_path.name.lower() == "index.html":
        return False

    # Read HTML file
    try:
        html = file_path.read_text(encoding="utf-8")
    except UnicodeDecodeError:
        html = file_path.read_text(
            encoding="utf-8",
            errors="ignore"
        )

    # Check whether navigation already exists
    has_home = re.search(
        r'>\s*Home\s*<',
        html,
        re.IGNORECASE
    )

    has_back = re.search(
        r'>\s*Back\s+to\s+(?:Programs|JavaScript Programs)\s*<',
        html,
        re.IGNORECASE
    )

    # If both already exist, don't change the file
    if has_home and has_back:
        return False

    # Find correct path from the program to JS/index.html
    home_path = Path(
        os.path.relpath(
            js_folder / "index.html",
            file_path.parent
        )
    ).as_posix()

    # Find correct path from the program to its folder's index.html
    back_path = Path(
        os.path.relpath(
            file_path.parent / "index.html",
            file_path.parent
        )
    ).as_posix()

    # Navigation section
    navigation = f"""
<div style="
    margin: 20px 0;
    padding: 12px;
    text-align: center;
    background: #f4f6f8;
    border-radius: 10px;
">
    <a href="{home_path}"
       style="
       display:inline-block;
       margin-right:10px;
       padding:10px 18px;
       background:#2563eb;
       color:white;
       text-decoration:none;
       border-radius:7px;
       font-weight:bold;
       ">
       Home
    </a>

    <a href="{back_path}"
       style="
       display:inline-block;
       padding:10px 18px;
       background:#374151;
       color:white;
       text-decoration:none;
       border-radius:7px;
       font-weight:bold;
       ">
       Back to Programs
    </a>
</div>
"""

    # Insert navigation before </body>
    if re.search(r"</body>", html, re.IGNORECASE):
        html = re.sub(
            r"</body>",
            navigation + "\n</body>",
            html,
            count=1,
            flags=re.IGNORECASE
        )
    else:
        html += navigation

    # Save the modified HTML
    file_path.write_text(
        html,
        encoding="utf-8"
    )

    return True


# Find every HTML file inside JS and all subfolders
html_files = list(js_folder.rglob("*.html"))

changed = 0
skipped = 0

print()
print("=" * 55)
print("Adding Home + Back to Programs navigation")
print("=" * 55)

for file in html_files:

    if file.name.lower() == "index.html":
        continue

    if add_navigation(file):
        changed += 1
        print(
            "Updated:",
            file.relative_to(js_folder)
        )
    else:
        skipped += 1


print()
print("=" * 55)
print("Navigation update complete!")
print("=" * 55)
print("Program files updated :", changed)
print("Already had navigation:", skipped)
print("Total HTML files found:", len(html_files))
print("=" * 55)