package com.linksharing

import CO.UserCo
import grails.gorm.transactions.Transactional

@Transactional
class UserSetupService {

    def springSecurityService
    def passwordEncoder


    def serviceMethod() {

    }

    boolean login(String username,String password){
        boolean flag=false
        def existingUser=User.findByUsername(username)
        if(passwordEncoder.isPasswordValid(existingUser.password,password,null)){
            flag=true
        }else{
            flag
        }
    }

    def register(UserCo userCo){
        boolean flag=false
        // Role role=new Role("ROLE_USER")
        User user=new User(userCo.email,userCo.username,userCo.password,userCo.firstName,userCo.lastName,userCo.photo)
        if(user.validate()){
            User u=user.save(flush: true)
            if(u!=null){
                flag=true

            }
        }else{
            user.errors.allErrors.each {println(it)}
        }
        if(flag){
            return "Success"
        }else{
            return "Failed"
        }

    }

    def logout(){


    }
}
