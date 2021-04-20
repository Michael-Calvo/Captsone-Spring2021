export interface User {
    uid: string;
    email: string;
    displayName: string;
    photoURL: string;
    emailVerified: boolean;
    definedData?: string;
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