package com.linksharing

import CO.UserCo
import grails.gorm.transactions.Transactional

@Transactional
class UserService {

    def serviceMethod() {

    }

    def read(Integer id){

        User user=User.get(id)
        if(user !=null){
            user.each {i->
                println(i.email+" " +  i.username+" "+i.password+" "+i.firstName+" "+i.lastName+" "+i.photo+" "+i.admin+" "+i.active+" "+
                        i.dateCreated+" "+i.lastUpdated)
            }
            return user
        }else{
            return "ID not found"
        }

    }

    def update(UserCo userCo){
        boolean flag=false
        User user=new User(userCo.email,userCo.userName,userCo.password,userCo.firstName,userCo.lastName,userCo.photo)
        if(user.validate()){
            User u=user.save(flush: true)
            if(u!=null){
                flag=true
            }
        }else{
            user.errors.allErrors.each {println(it)}
        }
        if(flag){
            return "Update Success"
        }else{
            return "Update Failed"
        }

    }

    def delete(Integer id){
        User user=User.get(id)
        if(user !=null){
            user.delete()
            return "Successfully Deleted"

        }else{
            return "User Not present"
        }


    }


}
