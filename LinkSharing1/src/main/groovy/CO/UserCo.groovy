package CO

import grails.validation.Validateable

class UserCo implements Validateable{
    String firstName
    String lastName
    String email
    String username
    String phoneNumber
    String password
    String confirmPassword
    byte[] photo

    static constraints={
        firstName blank: false,unique: true,nullable: false
        lastName blank: false,unique:  true, nullable: false
        email blank: false,unique: true,nullable: false,email: true
        username blank: false,unique:true,nullable: false
        password blank: false,unique: true,nullable: false
        confirmPassword blank: false,nullable: false
        phoneNumber blank: false, nullable: false
        photo blank: true,nullable: true
    }
}
