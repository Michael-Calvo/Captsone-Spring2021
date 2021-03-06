export interface FireBaseUser {
    uid: string;
    email: string;
    displayName: string;
    photoURL: string;
    emailVerified: boolean;
    definedData?: string;
}

export class DBUser{
    ID: number;
    UserName: string;
    FirstName: string;
    LastName: string;
    RoleID: number;
    IsActive: number;
    SortValue: number;

    constructor( ID: number, UserName: string, FirstName: string,  LastName: string, RoleID: number, IsActive: number, SortValue: number){
        this.ID = ID;
        this.UserName = UserName;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.RoleID = RoleID;
        this.IsActive = IsActive;
        this.SortValue = SortValue;

    }
}

export class DBUserForm_ADD{
    UserName: string;
    FirstName: string;
    LastName: string;
    RoleID: number;
    IsActive: number;
    SortValue: number;

    constructor( ){
        this.IsActive = 1;
        this.SortValue = 1;
    }
}

export class RoleID{
    roleID: number;
    role: string;

    constructor(roleID:number,role:string){
        this.roleID = roleID;
        this.role = role;
    }
    getRole(){
        return this.role;
    }
}

export class User2 {
    public UserName: string;
    constructor(UserName:string){
       this.UserName = UserName;
    }
  }