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
