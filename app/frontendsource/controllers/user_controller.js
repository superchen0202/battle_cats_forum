import axios from 'axios'
import { Controller } from "stimulus"

export default class extends Controller {
    
    static targets = [ "followButton" ]

    follow(event){

        event.preventDefault()
        
        let user = this.followButtonTarget.dataset.user
        let buttton = this.followButtonTarget
      
        //API routes：
        axios.post(`/users/${user}/follow`)
            .then(function(response){
                
                let status = response.data.status 
                //console.log(response.data);         //{status: "追蹤"}, {status: "還沒登入"}
                //console.log(response.data.status);  //"追蹤", '還沒登入'
                
                 switch(status){
                     case '還沒登入':
                         alert("請先登入")
                         break
                     default:
                         buttton.innerHTML = status;
                 }
            })
            
            .catch(function(error) {
                console.log(error);
            }) 
    }

}