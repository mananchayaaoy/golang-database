package main

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

type UsersData struct {
	ID              int
	CitizenID       string
	Firstname       string
	Lastname        string
	BirthYear       int
	FirstnameFather string
	LastnamrFather  string
	FirstnameMother string
	LastnameMother  string
	SoldierID       int
	AddressID       int
}

func main() {
	db, err := sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/testsck")
	defer db.Close()
	if err != nil {
		fmt.Println("Connect fail")
		fmt.Printf("Error : %s", err)
		return
	}

	fmt.Println("Connet Success")

	//fmt.Println(add(db))
	fmt.Println(readAll(db))
	fmt.Println(delete(db, 6))
	fmt.Println(readAll(db))
}

func readAll(db *sql.DB) []UsersData {
	result, _ := db.Query("SELECT * FROM users")
	var usersDataList []UsersData

	for result.Next() {
		var userData UsersData //เนื่องจากไม่ได้ประกาศเป็นอาร์เรย์ เลยให้วนใน for

		err := result.Scan(&userData.ID, &userData.CitizenID, &userData.Firstname, &userData.Lastname,
			&userData.BirthYear, &userData.FirstnameFather, &userData.LastnamrFather,
			&userData.FirstnameMother, &userData.LastnameMother, &userData.SoldierID, &userData.AddressID)

		if err != nil {
			panic(err)
		}

		usersDataList = append(usersDataList, userData)
	}
	return usersDataList
}

func add(db *sql.DB) bool {
	result, _ := db.Prepare("INSERT INTO testsck.users (citizen_id,firstname,lastname,birthyear,firstname_father,lastname_father,firstname_mother,lastname_mother,soldier_id,address_id) VALUES (?,?,?,?,?,?,?,?,?,?)")
	_, err := result.Exec("1220400128904", "กันต์", "อมรพลัง", 1997, "เมษา", "อมรพลัง", "สายทอง", "อมรพลัง", 678, 1)

	if err != nil {
		panic(err.Error)
		return false
	}

	return true
}

func delete(db *sql.DB, id int) bool {
	result, _ := db.Prepare("DELETE FROM testsck.users WHERE user_id = ? ")
	_, err := result.Exec(id)

	if err != nil {
		panic(err.Error())
		return false
	}
	return true

}
