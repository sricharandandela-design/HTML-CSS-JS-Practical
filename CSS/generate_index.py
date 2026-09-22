from pathlib import Path
import re

folder = Path(__file__).parent

files = [
    f for f in folder.glob("*.html")
    if f.name.lower() != "index.html"
]

def sort_key(file):
    match = re.search(r'(\d+)', file.stem)
    return int(match.group(1)) if match else 9999

files.sort(key=sort_key)

programs = ""

for i, file in enumerate(files, 1):
    programs += f"""
        <div class="program">
            <span class="program-name">
                {i}. {file.stem.replace("-", " ").replace("_", " ").title()}
            </span>

            <a class="open-btn" href="{file.name}">
                Open
            </a>
        </div>
"""

html = f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>CSS Practical Programs</title>

    <style>
        * {{
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }}

        body {{
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            color: #222;
        }}

        header {{
            background: #172033;
            color: white;
            text-align: center;
            padding: 45px 20px;
        }}

        header h1 {{
            font-size: 36px;
            margin-bottom: 10px;
        }}

        header p {{
            font-size: 18px;
            color: #d1d5db;
        }}

        .container {{
            max-width: 1100px;
            margin: 40px auto;
            padding: 20px;
        }}

        .info {{
            background: white;
            padding: 25px;
            border-radius: 15px;
            margin-bottom: 30px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }}

        .info h2 {{
            color: #2563eb;
            margin-bottom: 10px;
        }}

        .programs {{
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }}

        .programs h2 {{
            margin-bottom: 20px;
        }}

        .program {{
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            padding: 15px;
            margin-bottom: 10px;
            background: #f8fafc;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
        }}

        .program-name {{
            font-weight: bold;
            word-break: break-word;
        }}

        .open-btn {{
            background: #2563eb;
            color: white;
            text-decoration: none;
            padding: 9px 16px;
            border-radius: 7px;
            white-space: nowrap;
        }}

        .open-btn:hover {{
            background: #1d4ed8;
        }}

        .home {{
            text-align: center;
            margin-top: 30px;
        }}

        .home a {{
            color: #2563eb;
            text-decoration: none;
            font-weight: bold;
        }}

        @media (max-width: 650px) {{
            .program {{
                flex-direction: column;
                align-items: flex-start;
            }}

            .open-btn {{
                width: 100%;
                text-align: center;
            }}
        }}
    </style>
</head>

<body>

<header>
    <h1>CSS Practical Programs</h1>
    <p>HTML, CSS & JavaScript Practical Assignment</p>
</header>

<div class="container">

    <div class="info">
        <h2>{len(files)} CSS Programs</h2>
        <p>Explore all CSS practical programs and open each program directly.</p>
    </div>

    <div class="programs">

        <h2>CSS Programs</h2>

        {programs}

    </div>

    <div class="home">
        <a href="../index.html">← Back to Home</a>
    </div>

</div>

</body>
</html>
"""

(folder / "index.html").write_text(html, encoding="utf-8")

print(f"Done! {len(files)} CSS programs added to index.html")