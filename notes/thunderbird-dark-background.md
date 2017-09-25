Note thunderbird dark background
-----------------------------------------
Go to thunderbird:
   `Menu` -> `Help` -> `Troubleshooting Information` -> `about:profiles`

You can find where is your profile storage, somewhere like:

```bash
cd ~/.thunderbird/6py0ngzb.default
mkdir chrome
cd chrome
vim userContent.css
```

add the following lines to the css:

~~~css
=============[ userContent.css ]=================
* {
   color: white !important; 
   background-color: #282C39 !important;
   font-family: "Inconsolata-g\ for\ Powerline";
   font-size: 24px;
   font-style: normal;
   font-weight: 500;
   font-height: 26.4;
}

#content {
   background-color: #282C39 !important;
}

td {color: #282C39; background-color: white}

:link, .link, link {color: #F17700 }

@-moz-document url-prefix(mailbox:) {                                            
  /* all the other rules go here */                                              
}
~~~

Also to modify elements in the ui itself create the
following file:

```css
============[ userChrome.css ]====================
:link, .link, .textWrap, :textWrap { 
   color: #F17700 !important;
}
#content, browser, body {
   background-color: #282C39 !important;
}
```

-----------------------------------------
Tuesday 05 September 2017, 13:29:12
