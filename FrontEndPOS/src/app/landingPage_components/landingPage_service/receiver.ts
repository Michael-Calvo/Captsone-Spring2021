import { DBUser} from './user';

export interface Receiver {
    message: string;
    Objects:DBUser[];
}