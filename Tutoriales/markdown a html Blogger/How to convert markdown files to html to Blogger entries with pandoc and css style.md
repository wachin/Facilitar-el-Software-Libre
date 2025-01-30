# How to convert markdown files to html to Blogger entries with pandoc and css style

Here's a complete tutorial for publishing Markdown content on Blogger using Debian 12:

---

### **Complete Workflow: Markdown to Blogger with Math Support**

---

#### **1. Install Required Tools**
```bash
# Install Pandoc and math fonts
sudo apt update && sudo apt install pandoc fonts-lmodern

# Verify installation
pandoc --version
```

---

#### **2. CSS Setup in Blogger**

**A. Add CSS to Blogger Theme:**
1. Go to your Blogger Dashboard
2. Navigate to: **Theme → Customize → Advanced → Add CSS**
3. Paste this optimized CSS:
```css
/* Blogger Post Styles */
.post-content {
    font-family: 'Segoe UI', Roboto, sans-serif;
    line-height: 1.7;
    color: #333;
    max-width: 800px;
    margin: 0 auto;
    padding: 20px 0;
}

.post-content table {
    border: 2px solid #2c3e50 !important;
    border-collapse: collapse !important;
    margin: 1.5rem 0 !important;
    width: 100% !important;
}

.post-content th,
.post-content td {
    border: 1px solid #2c3e50 !important;
    padding: 0.75rem !important;
}

.post-content pre {
    border: 2px solid #3498db !important;
    background: #f8f9fa !important;
    padding: 1rem !important;
    margin: 1.5rem 0 !important;
    border-radius: 4px !important;
    overflow-x: auto !important;
    white-space: pre-wrap;
}

.post-content code {
    font-family: 'Fira Code', monospace !important;
    background: #f8f9fa !important;
    padding: 0.2em 0.4em !important;
}

.post-content .math {
    font-size: 1.1rem;
}
```
4. **Save** the theme changes

**B. Add Fonts to Template:**
1. In Blogger Dashboard: **Theme → Edit HTML**
2. Add before `</head>`:
```html
<link href="https://fonts.googleapis.com/css2?family=Fira+Code&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
```

---

#### **3. Convert Markdown to Blogger HTML**

**Conversion Command:**
```bash
pandoc input.md \
  -o output.html \
  --css=blog-style.css \
  --mathjax \
  --wrap=preserve \
  --standalone
```

**Flags Explanation:**
- `--mathjax`: Enables LaTeX math support
- `--wrap=preserve`: Maintains original line breaks
- `--css`: Links your stylesheet (for local preview)
- `--standalone`: Creates full HTML (remove this for Blogger)

---

#### **4. Prepare for Publishing**

**A. Edit the HTML Output:**
1. Open `output.html` in a text editor
2. Locate the `<body>` content
3. Wrap everything in:
```html
<div class="post-content">
  <!-- Your content here -->
</div>
```

**B. Add MathJax Support:**
At the end of the content (before closing `</div>`), add:
```html
<script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.js?config=TeX-MML-AM_CHTML'></script>
```

---

#### **5. Publish to Blogger**

1. Create a new post in Blogger
2. Switch to **HTML view** (top-left corner of editor)
3. Paste your prepared HTML content
4. Add these **Post Settings**:
   - **Labels**: Add relevant tags
   - **Permalink**: Set a clean URL
   - **Location**: Optional geotag
5. **Preview** to check formatting
6. Click **Publish**

---

#### **Verification Checklist**

1. **Tables:** Should have full borders (2px outer, 1px inner)
2. **Code Blocks:** Proper indentation with blue borders
3. **Math Equations:** Render as proper equations (test with `$$E=mc^2$$`)
4. **Responsiveness:** Check mobile view

---

#### **Troubleshooting Tips**

**If Math Doesn't Render:**
1. Ensure the MathJax script is present
2. Use proper LaTeX delimiters:
   - Inline: `\(...\)`
   - Display: `$$...$$`

**If Borders Missing:**
1. Force refresh with **Ctrl+F5**
2. Check CSS is added to theme
3. Add `!important` to border properties

**Conversion Command Cheatsheet:**
```bash
# Basic conversion
pandoc mypost.md -o blog-ready.html --mathjax

# With syntax highlighting
pandoc mypost.md -o blog-ready.html --mathjax --highlight-style=tango

# Preserve line breaks
pandoc mypost.md -o blog-ready.html --mathjax --wrap=preserve
```

---

This workflow maintains proper formatting while supporting mathematical equations through MathJax. The CSS is optimized to work with Blogger's template system while preserving Markdown's structure.

---

old:

pandoc input.md -o output-no-highlight.html --css=blog-style.css 
