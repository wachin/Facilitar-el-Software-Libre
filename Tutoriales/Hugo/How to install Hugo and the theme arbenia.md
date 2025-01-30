This is a step-by-step tutorial on how to install Hugo, set up a GitHub Pages site, and install the Arberia theme. This guide assumes you're using **Debian 12** (or a similar Linux distribution) and covers everything up to the point where the Google Analytics error might appear.

---

## **Step 1: Install Hugo**

### **Option 1: Install Hugo via `.deb` File (Recommended)**
1. **Download the latest Hugo `.deb` file:**
   - Visit the [Hugo GitHub Releases page](https://github.com/gohugoio/hugo/releases).
   - Find the latest version for Linux (e.g., `hugo_extended_withdeploy_*.*.*_Linux-64bit.deb`).
   - Download it example using `wget`:
     ```bash
     wget https://github.com/gohugoio/hugo/releases/download/v0.141.0/hugo_extended_withdeploy_0.141.0_linux-amd64.deb
     ```

2. **Install the `.deb` file:**
   ```bash
   sudo dpkg -i hugo_extended_withdeploy_*.*.*_linux-amd64.deb
   ```

3. **Verify the installation:**
   ```bash
   hugo version
   ```
   You should see the installed Hugo version.

---

### **Option 2: Install Hugo via Snap (Alternative)**
If you prefer using Snap:
```bash
sudo snap install hugo
```

---

## **Step 2: Set Up a GitHub Pages Site**

1. **Create a GitHub repository:**
   - Go to [GitHub](https://github.com) and create a new repository named `username.github.io`, where `username` is your GitHub username (e.g., `wachin.github.io`).

2. **Clone the repository to your local machine:**
   ```bash
   git clone https://github.com/username/username.github.io
   cd username.github.io
   ```

3. **Create a simple `index.html` file to test GitHub Pages:**
   ```bash
   echo "Hi World" > index.html
   ```

4. **Commit and push the changes:**
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```
   
5. Setup on github your repository, example:

https://github.com/username/username.github.io/settings

where `username` is your GitHub username and github page name. Then Click on **Pages** at the bottom left or ir:

https://github.com/username/username.github.io/settings/pages

where `username` is your GitHub username and github page name, and be sure that the name of your page appear there, and in the branch that is configured in "main"

6. **Verify your GitHub Pages site:**
   - Visit `https://username.github.io` in your browser.
   - You should see "Hi World" displayed.

---

## **Step 3: Initialize a Hugo Site**

1. **Navigate to your repository directory:**
   ```bash
   cd username.github.io
   ```

2. **Initialize a new Hugo site:**
   ```bash
   hugo new site . --force
   ```
   The `--force` flag is used because the directory is not empty (it contains `index.html`).

3. **Remove the `index.html` file:**
   ```bash
   rm index.html
   ```

---

## **Step 4: Install the Arberia Theme**

1. The theme installation instruction on the website has the instruction to initialize the repository:

 **Initialize a Git repository (if not already initialized):**
   ```bash
   git init
   ```
but we have already initialized it so it will not be necessary to do that.

2. **Add the Arberia theme as a submodule:**
   ```bash
   git submodule add https://github.com/antedoro/arberia.git themes/arberia
   ```

3. **Update your `config.toml` file to use the Arberia theme:**
   Open the `config.toml` file and add the following line:
   ```toml
   theme = "arberia"
   ```

---

## **Step 5: Configure Your Hugo Site**

1. **Create a basic `config.toml` file:**
   Open the `config.toml` file and add the following configuration, because with this working:
   ```toml
baseURL = "https://username.github.io/"
languageCode = "en-us"
title = "Your Site Title"
theme = "arberia"
lastmod = "2025-01-21"  # Replace with the current date or the last modified date of your site

# Required by Arberia theme
[params]
  dateFormat = "January 2, 2006"  # Date format for posts
  footerMenu = false              # Set to true if you want a footer menu
  socialIcons = false             # Set to true if you want social icons
  showReadingTime = true          # Show estimated reading time for posts
  showWordCount = true            # Show word count for posts
  showAuthor = true               # Show author name in posts
  showDate = true                 # Show date in posts

# Optional: Add a menu (if needed)
[menu]
  [[menu.footer]]
    name = "Home"
    url = "/"
    weight = 1
  [[menu.footer]]
    name = "About"
    url = "/about/"
    weight = 2

# Optional: Add social links (if needed)
[social]
  twitter = "your_twitter_handle"
  github = "your_github_username"
   ```

2. **Create your first post:**
   ```bash
   hugo new posts/my-first-post.md
   ```
   Edit the generated Markdown file in `content/posts/` to add your content.

   Luego abre el archivo:
   
   my-first-post.md
   
   y donde dice: 
   
   draft: true
   
   cambialo por:
   
   draft: false
   
   para que no sea un borrador y se pueda publciar en https://wachin.github.io/ exactamente en: https://wachin.github.io/posts/
   
---

## **Step 6: Test Your Site Locally**

1. **Start the Hugo server:**
   ```bash
   hugo server -D
   ```

2. **Preview your site:**
   - Open your browser and go to `http://localhost:1313`.
   - You should see your Hugo site with the Arberia theme applied.

---

## **Step 7: Deploy to GitHub Pages**

Hugo is a **static site generator**. This means it takes your content (like Markdown files) and turns it into a set of **static files** (HTML, CSS, JavaScript, etc.). Deploying a site means making it available on the internet so that anyone can visit it using a web browser (like Chrome, Firefox, or Safari). When you deploy a site, you're essentially taking the files you've created (like HTML, CSS, and images) and putting them on a server that is connected to the internet. This server "hosts" your site, meaning it stores the files and delivers them to visitors when they type in your website's address, in this case Github Pages is the server.

1. **Build your site:**
   ```bash
   hugo
   ```
   This generates static files in the `public/` directory.

2. **Copy the contents of the `public/` directory to the root of your repository:**
   ```bash
   cp -r public/* .
   ```
**Why Do We Use the `public/` Folder?**

The `public/` folder is where Hugo stores the final version of your site after it has been built. It contains:
- **HTML files**: These define the structure of your web pages.
- **CSS files**: These control the styling (colors, fonts, layout, etc.).
- **JavaScript files**: These add interactivity (like buttons or animations).
- **Images and other assets**: These are the visual elements of your site.

When you deploy your site, you're essentially uploading the contents of this `public/` folder to a server.

3. **Commit and push your changes:**
   ```bash
   git add .
   git commit -m "Deploy Hugo site with Arberia theme"
   git push origin main
   ```

4. **Verify your GitHub Pages site:**
   - Visit `https://username.github.io` in your browser.
   - You should see your Hugo site live.

---

## **Step 8: Troubleshooting (Before Google Analytics Error)**

If you encounter issues:
1. **Check Hugo version compatibility:**
   Ensure your Hugo version matches the theme's requirements. Update Hugo if necessary (see Step 1).

2. **Check theme documentation:**
   Refer to the [Arberia theme documentation](https://github.com/antedoro/arberia) for additional configuration options.

3. **Clear Hugo cache:**
   ```bash
   hugo --gc
   ```

   
   
   
   
   
   
   
   
   


