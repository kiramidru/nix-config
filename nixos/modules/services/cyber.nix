{ pkgs, ... }:
{
  # Cyber
  environment.systemPackages = with pkgs; [
    bat
    ranger

    ### Exploitation ###
    metasploit
    sqlmap

    ### Forensics ###
    capstone
    ddrescue
    ext4magic
    extundelete
    ghidra-bin
    git
    pdf-parser
    sleuthkit

    ### Hardware ###
    apktool

    ### Recon ###
    cloudbrute
    dnsenum
    dnsrecon
    enum4linux
    hping
    masscan
    netcat
    nmap
    ntopng
    sn0int
    sslsplit
    theharvester
    wireshark
    # wireshark-cli

    ### Backdoors ###
    httptunnel
    pwnat

    ### Passwords ###
    brutespray
    chntpw
    crowbar
    crunch
    hashcat
    hcxtools
    john

    ### Reverse ###
    binutils
    elfutils
    patchelf
    radare2
    retdec
    snowman
    valgrind
    yara

    ### Sniffing ###
    bettercap
    dsniff
    mitmproxy
    rshijack
    sipp
    sniffglue

    ### Vuln analisys ###
    grype
    lynis
    sqlmap
    vulnix

    ### Web ###
    # burpsuite
    dirb
    gobuster
    urlhunter
    wfuzz
    # wpscan
    zap
  ];
}
