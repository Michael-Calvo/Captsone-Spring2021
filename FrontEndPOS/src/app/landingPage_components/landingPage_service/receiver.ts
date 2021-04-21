import { DBUser, User2 } from '../landingPage_service/user/user';

export interface Receiver {
    message: string;
    Objects:DBUser[];
}