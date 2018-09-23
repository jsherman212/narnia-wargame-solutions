For this challenge, we had to store shellcode at the enviornment variable EGG.

For some reason, after I figured out the shellcode to spawn a shell, the shell was not being executed as narnia2 even though the owner of the file is narnia2. I had to add some shellcode to set my euid/ruid to narnia2's and it worked.
