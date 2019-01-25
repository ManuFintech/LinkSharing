package com.linksharing

import grails.gorm.transactions.Transactional
import org.springframework.web.multipart.MultipartFile

@Transactional
class DocumentResourceService {
    def grailsApplication
    def springSecurityService

    def serviceMethod() {

    }

    def uploadDocument(def comingfile,def description,def topicID){
        User user=springSecurityService.currentUser
        println("+pppppppppppppppppppppppppp"+comingfile+" "+description+" "+topicID+" "+user)
        Topic topic=Topic.findById(topicID)
        MultipartFile file=comingfile
        println("ffffffffffffffffffffffffff"+file)
        if(file.empty) {
            println("Empty")
        } else {
            DocumentResource documentInstance = new DocumentResource()
            documentInstance.description=description
            documentInstance.createdBy=user
            documentInstance.topic=topic
            documentInstance.fileName = file.originalFilename
            println("uuuuuuuuuuuuuuuuuuuuu"+grailsApplication.config.uploadFolder)
            documentInstance.fullPath = grailsApplication.config.uploadFolder + documentInstance.fileName
            file.transferTo(new File(documentInstance.fullPath))
            if(!documentInstance.save(flush: true)){
                documentInstance.errors.allErrors.each {
                    println it
                }
            }else
                println "Success"
        }
        return "Success"

    }
}
