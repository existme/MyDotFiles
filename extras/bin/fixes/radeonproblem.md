        
[4] vgaswitcheroo and PRIME

First thing you should check is if your discrete GPU is even turned on. By default it should be off.
CODE: SELECT ALL
$ sudo su
# cat /sys/kernel/debug/vgaswitcheroo/switch 
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :Pwr:0000:01:00.0

The above output is what you should get if your discrete GPU is on (third line). The + sign indicates which GPU is currently used, in this case it's the integrated GPU.

For more info on vgaswitcheroo see https://help.ubuntu.com/community/HybridGraphics

MUXED SYSTEMS:

WARNING: I did NOT test this. Please report if it worked/didn't work and I will update this section of the tutorial.

At this point you should be able to just turn your discrete graphics on, restart X and have it working:
CODE: SELECT ALL
# echo DDIS > /sys/kernel/debug/vgaswitcheroo/switch

This command will instruct your system to activate your discrete GPU next time X starts. Just log off and log back in again to trigger this.

If you want to disable your discrete GPU to get more battery life from your laptop:
CODE: SELECT ALL
# echo OFF > /sys/kernel/debug/vgaswitcheroo/switch

Log out and log in again for changes to take effect.

MUXLESS SYSTEMS

First thing you need to do is turn on your discrete GPU if it's not turned on already:
CODE: SELECT ALL
# echo ON > /sys/kernel/debug/vgaswitcheroo/switch

Verify that this worked by issuing this command again:
CODE: SELECT ALL
# cat /sys/kernel/debug/vgaswitcheroo/switch


Now, we have to know IDs that xrandr assigned to your cards. Do this as the regular user again, not root:
CODE: SELECT ALL
$ xrandr --listproviders
Providers: number : 3
Provider 0: id: 108 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs: 3 outputs: 4 associated providers: 2 name:Intel
Provider 1: id: 69 cap: 0xf, Source Output, Sink Output, Source Offload, Sink Offload crtcs: 6 outputs: 0 associated providers: 2 name:radeon
Provider 2: id: 69 cap: 0xf, Source Output, Sink Output, Source Offload, Sink Offload crtcs: 6 outputs: 0 associated providers: 2 name:radeon

In my case 3 cards get listed. Notice that both provides 1 and 2 have the same id. In this case my discrete card has id 69 and my integrated card has id 108.

Last thing we need it to tell X to use your discrete GPU for rendering:
CODE: SELECT ALL
$ xrandr --setprovideroffloadsink 69 108

Where the first number is your discrete card and the second one is your integrated card. To verify this worked:
CODE: SELECT ALL
$ DRI_PRIME=1 glxinfo | grep renderer
OpenGL renderer string: Gallium 0.4 on AMD TURKS

You should get Gallium 0.4 as your renderer. From now on all your 3D apps will be rendered on your ATI card, no need to restart X.

This has been tested on a Radeon HD 7670M and a i5 IvyBridge CPU. I have experienced similar or even better performance in both native games and wine compared to using the proprietary fglrx driver.

If you have any additional info, helpful scripts or any other feedback please post and I will update this tutorial.

Happy gaming :)

EDIT: Whoops, wrong section... can a mod please move this to proper subforum? Thanks.
Top
halfgaar
Level 1
Level 1
Posts: 21
Joined: Thu Nov 21, 2013 3:40 pm
Re: [HOWTO] ATI hybrid graphics with open source radeon driv
Postby halfgaar » Thu Feb 06, 2014 4:19 pm

Thanks, I wish I could upvote here :)

However, what does one do if you have no vgaswitcheroo? I have a Samsung Series 7 730U (NP730U3E to be exact) with Radeon HD 8730M video, and especially since Mint 16, it's a hot, noisy, coal with short battery life. I wish to turn off the Radeon HD 8730M alltogether. But, I have no vgaswitcheroo...

fglrx-pxpress doesn't work. I just crashes without error message. And, I guess it's for the fgrlx driver, which also doesn't seem to work for the 8000 series Radeon.

(edit, BTW: linux mint 16, xorg 1.14, xserver-xorg-video-ati 1:7.2.0-0ubuntu10, kernel 3.11)
Top
Onyx47
Level 1
Level 1
Posts: 7
Joined: Thu Jul 11, 2013 9:47 am
Re: [HOWTO] ATI hybrid graphics with open source radeon driv
Postby Onyx47 » Thu Feb 06, 2014 4:43 pm

halfgaar wrote:
However, what does one do if you have no vgaswitcheroo?


Yeah... I already wrote a complete reply and decided to hit up Google since I remembered reading something about 3.12 kernel power management changes.

The good news is, this should all automagically work now.
The bad news is, seems to be broken for mobility Radeon 7xxx. Fun.

See http://phoronix.com/forums/showthread.p ... sappearing

So yeah, this tutorial is now obsolete if you're running LM 16. Hopefully this gets fixed soon. I'm on LM 15 still myself, and in the light of this I think I'm postponing the upgrade for now, even though the 3.12 kernel was my main reason to upgrade until now. :(

EDIT: I just noticed you said your kernel was 3.11, not 3.12, not sure when changes hit, but check if your symptoms match those in the linked thread.
Top
halfgaar
Level 1
Level 1
Posts: 21
Joined: Thu Nov 21, 2013 3:40 pm
Re: [HOWTO] ATI hybrid graphics with open source radeon driv
Postby halfgaar » Fri Feb 07, 2014 4:07 am

I was reading up on Radeon power management. I enabled it by adding radeon.dpm=1 as kernel boot parameter in /etc/default/grub. Dmesg says it's enabled, and idle power use is now about 13W (which is about the same as it was with LM 15). It was about 18-19W without dpm. I still have to experiment with the tunables, though.

If I remember correctly, I also read that kernel 3.12 provides battery life on par with Windows (at least for people with an i5 or i7 and muxless Radeon chip, I think). Kernel 3.13 has the radeon.dpm enabled by default. I'm considering upgrading the kernel with a PPA.
