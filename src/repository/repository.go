package repository

import "database/sql"

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

func ReadAll(db *sql.DB) []UsersData {
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

func Add(db *sql.DB) bool {
	statement, _ := db.Prepare("INSERT INTO testsck.users (citizen_id,firstname,lastname,birthyear,firstname_father,lastname_father,firstname_mother,lastname_mother,soldier_id,address_id) VALUES (?,?,?,?,?,?,?,?,?,?)")
	defer statement.Close()
	_, err := statement.Exec("1220400128904", "กันต์", "อมรพลัง", 1997, "เมษา", "อมรพลัง", "สายทอง", "อมรพลัง", 678, 1)

	if err != nil {
		panic(err.Error)
		return false
	}

	return true
}

func Delete(db *sql.DB, id int) bool {
	statement, _ := db.Prepare("DELETE FROM testsck.users WHERE user_id = ? ")
	defer statement.Close()
	_, err := statement.Exec(id)

	if err != nil {
		panic(err.Error())
		return false
	}
	return true

}

func Edit(db *sql.DB, id int, firstnameFather string) bool {
	statement, _ := db.Prepare("UPDATE testsck.users SET firstname_father = ? WHERE user_id = ?")
	defer statement.Close()
	_, err := statement.Exec(firstnameFather, id)

	if err != nil {
		panic(err.Error())
		return false
	}
	return true
}

func ReadById(db *sql.DB, id int) UsersData {
	statement, _ := db.Prepare("SELECT * FROM users WHERE user_id = ?")
	defer statement.Close()
	result, err := statement.Query(id)

	var userData UsersData //เนื่องจากไม่ได้ประกาศเป็นอาร์เรย์ เลยให้วนใน for
	for result.Next() {
		err = result.Scan(&userData.ID, &userData.CitizenID, &userData.Firstname, &userData.Lastname,
			&userData.BirthYear, &userData.FirstnameFather, &userData.LastnamrFather,
			&userData.FirstnameMother, &userData.LastnameMother, &userData.SoldierID, &userData.AddressID)

		if err != nil {
			panic(err)
		}
	}

	return userData
}
