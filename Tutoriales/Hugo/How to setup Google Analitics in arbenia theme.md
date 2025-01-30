Sure! Let’s get Google Analytics working on your Hugo site. Google Analytics is a powerful tool that helps you track visitors to your website, such as how many people visit your site, where they come from, and what pages they view.

Here’s a step-by-step guide to integrating Google Analytics into your Hugo site:

---

## **Step 1: Set Up Google Analytics**

1. **Create a Google Analytics Account:**
   - Go to [Google Analytics](https://analytics.google.com/).
   - Sign in with your Google account.
   - Click **Start measuring**.

2. **Set Up a Property:**
   - Enter a name for your property (e.g., "My Hugo Site").
   - Configure your time zone and currency.
   - Click **Next**.

3. **Get Your Tracking ID:**
   - After setting up the property, you’ll be given a **Measurement ID** (e.g., `G-XXXXXXXXXX`). This is what you’ll use to connect Google Analytics to your Hugo site.

---

## **Step 2: Add Google Analytics to Your Hugo Site**

### **Option 1: Use Hugo’s Built-In Google Analytics Template**
Hugo has a built-in template for Google Analytics, which makes integration easy.

1. **Open your `config.toml` file** and add the following line:
   ```toml
   googleAnalytics = "G-XXXXXXXXXX"  # Replace with your Measurement ID
   ```

2. **Rebuild and Test Your Site:**
   - Run the Hugo server:
     ```bash
     hugo server -D
     ```
   - Visit your site locally and check if the Google Analytics script is included in the `<head>` section of your HTML. You can do this by right-clicking on your site, selecting **Inspect**, and searching for `gtag.js` or your Measurement ID.

3. **Deploy Your Site:**
   - Build your site:
     ```bash
     hugo
     ```
   - Copy the contents of the `public/` folder to your GitHub repository:
     ```bash
     cp -r public/* .
     ```
   - Commit and push your changes:
     ```bash
     git add .
     git commit -m "Added Google Analytics"
     git push origin main
     ```

---

### **Option 2: Manually Add Google Analytics Code**
If the built-in template doesn’t work (e.g., due to theme compatibility issues), you can manually add the Google Analytics code.

1. **Get the Google Analytics Tracking Code:**
   - In your Google Analytics account, go to **Admin** > **Data Streams** > **Your Stream** > **Tagging Instructions**.
   - Copy the **Global Site Tag (gtag.js)** code. It will look something like this:
     ```html
     <!-- Google tag (gtag.js) -->
     <script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
     <script>
       window.dataLayer = window.dataLayer || [];
       function gtag(){dataLayer.push(arguments);}
       gtag('js', new Date());
       gtag('config', 'G-XXXXXXXXXX');
     </script>
     ```

2. **Add the Code to Your Hugo Site:**
   - Create a file called `google-analytics.html` in the `layouts/partials/` directory:
     ```bash
     mkdir -p layouts/partials
     touch layouts/partials/google-analytics.html
     ```
   - Paste the Google Analytics code into this file.

3. **Include the Partial in Your Theme:**
   - Open your theme’s `head.html` file (usually located in `themes/arberia/layouts/partials/head.html`).
   - Add the following line where you want the Google Analytics code to appear (usually near the top of the `<head>` section):
     ```html
     {{ partial "google-analytics.html" . }}
     ```

4. **Rebuild and Test Your Site:**
   - Run the Hugo server:
     ```bash
     hugo server -D
     ```
   - Check if the Google Analytics script is included in the `<head>` section of your HTML.

5. **Deploy Your Site:**
   - Build your site:
     ```bash
     hugo
     ```
   - Copy the contents of the `public/` folder to your GitHub repository:
     ```bash
     cp -r public/* .
     ```
   - Commit and push your changes:
     ```bash
     git add .
     git commit -m "Added Google Analytics manually"
     git push origin main
     ```

---

## **Step 3: Verify Google Analytics Is Working**

1. **Visit Your Site:**
   - Go to your live site (`https://username.github.io`).

2. **Check Real-Time Data in Google Analytics:**
   - Log in to your Google Analytics account.
   - Go to **Reports** > **Realtime** > **Overview**.
   - If everything is set up correctly, you should see active users on your site.

---

## **Troubleshooting**

If Google Analytics isn’t working:
1. **Check the Tracking Code:**
   - Ensure the Measurement ID in your `config.toml` or `google-analytics.html` file is correct.

2. **Clear Browser Cache:**
   - Sometimes, your browser might cache the old version of your site. Clear your cache or try visiting your site in an incognito window.

3. **Check for JavaScript Errors:**
   - Open your browser’s developer tools (right-click > Inspect > Console) and look for errors related to Google Analytics.

4. **Verify the Partial Is Included:**
   - Ensure the `{{ partial "google-analytics.html" . }}` line is correctly added to your theme’s `head.html` file.

---

That’s it! You’ve successfully integrated Google Analytics into your Hugo site. Let me know if you encounter any issues or need further assistance! 🚀
