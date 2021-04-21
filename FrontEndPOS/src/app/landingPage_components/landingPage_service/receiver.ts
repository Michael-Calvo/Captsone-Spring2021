import { DBUser} from '../landingPage_service/user/user';

export interface Receiver {
    message: string;
    Objects:DBUser[];
}