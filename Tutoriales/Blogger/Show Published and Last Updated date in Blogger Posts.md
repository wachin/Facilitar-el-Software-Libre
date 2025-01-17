# Show Published and Last Updated date in Blogger Posts

https://www.twistblogg.com/2019/09/show-published-and-last-updated-date-in-blogger-post.html

Blogger allows you to show last updated date along with published date in posts. You need to add a timestamp tag. This article will guide you.

- Blogger.com comes with a powerful editor that allows you to write articles and share with multiple audiences. Once you are done writing and publish button is pressed, the published time is recorded in a tag variable

 

```
<data:post.timestamp/>
```

 

and when you visit that post, a published date is visible.But what if you edit the same article and want your visitors to see the last updated date? Can you? The answer is yes you can show it, there is another tag variable

 

```
<data:post.lastupdatedISO8601/>
```

 

that keeps record of last modified date, however the output of this variable is boring (to say). In this article we will rectify that problem.

Note: If you follow the no modification rule for blogging, then you wont need this article since you won't press update button for a post. However, if you are a

 

dynamic blogger

 

like me,who keep fixing posts, even a typo mistake, you may want this changing date to be shown to your readers, especially because you make a major change to your post and you do not want to add a section for recording changes you have made to the post, then this article to

 

show recent updated date along with published date in blogger post

 

is for you.



First of all, we will analyze the commonly followed technique to show the updated date and elaborate why it is not a good idea to follow. Later on, I'll discuss what you should be doing. Press that Jump to Solution button if you want to check the fix in a click.

[Jump To Solution](https://www.twistblogg.com/2019/09/show-published-and-last-updated-date-in-blogger-post.html#jumptome)

## Technique 1: Drafting the post to show the updated date.

In this technique, a blogger will draft his published post that needs to be updated or modified, and once everything is fixed, he/she will press the Publish button again.

![show updated date in blogger post](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj0amjekLxqzB27tKagz_FghL2xm85HQxPDCZkM6NS1IlZyFM4c96qgvVVbOTNABnzSxifnD4qeNvgn1c0xL3wETVe1Sa4GigZBE4YxXVRXG0KYhaC5TZp_R4xQ40fOdwjqCsz9XRiL2Aj7/s640-rw/modify.png)

#### Why re-publishing posts is not a good idea?

When you re-publish the posts, the address of that post changes. A new permalink is generated, and the already indexed link is no longer available. When search engine crawls your website, the previous link gets a

 

404 error

 

and the traffic you were generating from that respective post continuously drops. But a solution to this problem is : 301 redirects.

We've published an article on

 

how you can redirect one address to another for preventing traffic loss

. Again, the drawback is there will only be one date: name it either a published or an updated date. Both will be the same, however our motive was to show both. Let's jump to a more robust solution to show both published and updated date in blogger posts.

Recommended: In case your contact form is not sending mails, check out this post.



## Technique 2: Using bloggers' Tag to show the post last modified date

I've already discussed about a tag

 

```
<data:post.lastupdatedISO8601/>
```

that keeps record of updated dates for every blogger posts. So can we just add that tag at the specific position to make it work? The answer is yes you can, however you shouldn't just add it because it outputs non-user friendly date (2019-09-06To8:34:15Z) and requires visitor's energy to understand. Let's tweak the code and make it readable: First of all

 

Backup your Blog

.

The below process is for Blogger old layout.

In case you're using **Blogger Layout v3.0**, you can directly use this tag and show last updated date: `<data:post.lastUpdated/>`

- Step 1: Go to **Blogger.com** > **Blog Name** > **Theme** > **EDIT HTML**.
- Step 2: Press anywhere inside the code and press **CTRL + F** to search for the specific location

There is no any specific location I can write here. It depends on your template design. Either it will be somewhere near

 

```
<div class='post-header'>
```

 

or let me know and I'll strive to help you figure it out.

- Step 3: Once the location is known, paste the following code and click on Save Template. Refresh the post and bingo, you can see the changes. 

```js
<i class='far fa-calendar-alt'/> Published On:  <data:post.timestamp/>  | <i class='fas fa-sync'/> Updated on:  
<span class='updated' expr:title='"Post was updated on " + data:post.lastUpdatedISO8601' id='updatedateinfo' itemprop='dateModified'>
    <data:post.lastUpdatedISO8601/>
  </span>
  <script>
    var dates = "<data:post.lastUpdatedISO8601/>";
    var dateu = new Date(dates);
    var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
    document.getElementById("updatedateinfo").innerHTML = months[dateu.getMonth()] + " " + dateu.getDate() + ", " + dateu.getFullYear();
  </script>
<data:post.timestamp/>
```

  stores published date.

```
<data:post.lastUpdatedISO8601/>
```

 

stores last updated date and above we are formatting the display.

#### How to fix Published date not in proper format MM/DD/YY ?

Sometimes,the published date gets messed up, and sometimes you will see only a time or a full date and time with seconds too. Thanks to

 

stackoverflow

 

for the help.

- Go to **Settings** > **Language And Formatting**.
- Check the **Timestamp Format** option and select the one that you want. Done.

![change the published date format in blogger](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiQagaXHF7SSO5wwdeCFDdwh3RypgrJRCTL0xe3dSYLX3zNQ73KUzJTbhv1auF6N972aO0T-BlPFdg_LncHvU0gYFgUMGUNELeVPjPx0Lo9lQKkPqu7aJ_YjZpgZwuO-en30uHak5esbBTw/s640-rw/change+published+date+format+in+blogger+post.png)

Wasn't that easy? Well, thanks to

 

OneTransistor

 

for the help. You can check our blogger to see code in action. With this simple trick, you can

 

show published and updated/modified date in your blogger post just like Wordpress websites

. If you are facing any issues, leave a comment. Happy Blogging 😃