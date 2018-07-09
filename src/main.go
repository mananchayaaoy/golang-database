package main

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

func main() {
	_, err := sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/testsck")

	if err != nil {
		fmt.Println("Connect fail")
		fmt.Printf("Error : %s", err)
		return
	}

	fmt.Println("Connet Success")
}
