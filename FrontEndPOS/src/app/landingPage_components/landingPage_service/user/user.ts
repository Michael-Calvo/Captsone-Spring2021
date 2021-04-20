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
    UUID: string;
    isActive: number;
    SortValue: number;

    constructor( ID: number, UserName: string, FirstName: string,  LastName: string, RoleID: number, UUID: string, isActive: number, SortValue: number){
        this.ID = ID;
        this.UserName = UserName;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.RoleID = RoleID;
        this.UUID = UUID;
        this.isActive = isActive;
        this.SortValue = SortValue;

    }

    getUserName(){
        return this.UserName;
    }
    getRoleID(){
        return this.RoleID;
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
    public userName: string;
    public roleID: number;
    public role: string;
  
    constructor(userName:string,roleID:number,role:string){
       this.userName = userName;
       this.roleID = roleID; 
       this.role = role;
  
    }
  
    getUserName(){
        return this.userName;
    }
  
    setUserName(userName:string){
        this.userName = userName;
    }
  
    setUserNameFromEmail(email:string){
        var splitEmail = email.split("@",1);
        this.userName = splitEmail[0];
    }
  
    getRoleID(){
        return this.roleID;
    }
  
    setRoleID(roleID:number){
        this.roleID = roleID;
    }
    
    getRole(){
        return this.getRole;
    }
  
    setRole(role:string){
        this.role = role;
    }
  
  }