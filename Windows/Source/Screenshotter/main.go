 package main

 import (
 	"github.com/vova616/screenshot"
 	"fmt"
 	"time"
 	"github.com/pkg/sftp"
	"golang.org/x/crypto/ssh"
	"log"
	"bytes"
	"image/png"
 )

 func uploadscreenshot(imagestr []byte) { 
 var (
 err  error
 sftpClient *sftp.Client
 )
 sftpClient, err = connect("username", "password", "server", 22)
 if err != nil {
 log.Fatal(err)
 }
 defer sftpClient.Close()
	w := sftpClient.Walk("/tmp")
	for w.Step() {
		if w.Err() != nil {
			continue
		}
	}

	fileloc := fmt.Sprintf("/tmp/%s.png",time.Now().Format(time.RFC850))
	fmt.Println(fileloc)
	f, err := sftpClient.Create(fileloc)
	if err != nil {
		log.Fatal(err)
	}
	if _, err := f.Write([]byte(imagestr)); err != nil {
		log.Fatal(err)
	}
}

func connect(user, password, host string, port int) (*sftp.Client, error) { 
 var (
 auth   []ssh.AuthMethod
 addr   string
 clientConfig *ssh.ClientConfig
 sshClient *ssh.Client
 sftpClient *sftp.Client
 err   error
 )
 auth = make([]ssh.AuthMethod, 0)
 auth = append(auth, ssh.Password(password))

 clientConfig = &ssh.ClientConfig{
 User: user,
 HostKeyCallback: ssh.InsecureIgnoreHostKey(),
 Auth: auth,
 Timeout: 30 * time.Second,
 }

 addr = fmt.Sprintf("%s:%d", host, port)

 if sshClient, err = ssh.Dial("tcp", addr, clientConfig); err != nil {
 return nil, err
 }
 if sftpClient, err = sftp.NewClient(sshClient); err != nil {
 return nil, err
 }

 return sftpClient, nil
}

 func main() {
 	takescreenshot()
    for t := range time.NewTicker(120 * time.Second).C {
    	_ = t
        takescreenshot()
    }
 }

 func takescreenshot() {
	img, err := screenshot.CaptureScreen()
	        if err != nil {
          
        }
	buf := new(bytes.Buffer)
	png.Encode(buf,img)
	uploadscreenshot(buf.Bytes())
 }