package com.linksharing

import CO.UserCo
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.web.mapping.LinkGenerator

@Transactional
class UserSetupService {

    def springSecurityService
    def passwordEncoder
    def mailService
    LinkGenerator grailsLinkGenerator


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
        def role= Role.findByAuthority("ROLE_USER")
        def user=new User(userCo.email,userCo.username,userCo.password,userCo.firstName,userCo.lastName,userCo.phoneNumber)
        if(user.validate()){
            if(user.save(flush: true))
                UserRole.create(user,role,true)
                UserRole.withSession {
                    it.flush()
                    it.clear()
                }
                flag=true


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

    def resetuserPasword(String oldPassword, String newPassword,String email) {
        println(">>>>>>>>>>>>>>>>>>>>>>>>>>>1"+oldPassword+" "+newPassword)
        User user1= User.findByEmail(email)
        println(">>>>>>>>>>>>>>>>>>>>>>>>>>>4"+user1+" "+user1.firstName)
        if(oldPassword.equals(newPassword)){
            println(">>>>>>>>>>>>>>>>>>>>>>>>>>>5")
            return "Cannot use the same password."
        }else{
            println(">>>>>>>>>>>>>>>>>>>>>>>>>>>6")
            user1.password=newPassword
                    //springSecurityService.encodePassword(newPassword,user1.username)
            println(">>>>>>>>>>>>>>>>>>>>>>>>>>>7")
            user1.save()
            println(">>>>>>>>>>>>>>>>>>>>>>>>>>>8")
            return "Password Successfully updated"
        }


    }

    @Secured('permitAll')
    def sendMail(String email){
        String paswordLink=generateLink()
    mailService.sendMail {
        println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+email)
        to 'manu.mishra.1993@gmail.com'
        from "manu@fintechlabs.in"
        subject "Reset Password"
        text 'Link is given below:' +
                paswordLink
    }
    }

    def generateLink(){
        String link=grailsLinkGenerator.link(controller:'userSetup',action:'passwordGeneratorView',absolute: true)
        return link
    }
}
