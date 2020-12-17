import axios from 'axios'
import { Controller } from "stimulus"

export default class extends Controller {
    
    static targets = [ "followButton", "bookmark" ]

    follow(event){

        event.preventDefault()
        
        let user = this.followButtonTarget.dataset.user
        let buttton = this.followButtonTarget
      
        //API routes：
        axios.post(`/api/users/${user}/follow`)
            .then(function(response){
                
                let status = response.data.status 
                console.log(response.data);         //{status: "追蹤"}, {status: "還沒登入"}
                //console.log(response.data.status);  //"追蹤", '還沒登入'
                
                 switch(status){
                     case '請先登入':
                         alert("請先登入!")
                         break
                     default:
                         buttton.innerHTML = status;
                 }
            })
            
            .catch(function(error) {
                console.log(error);
            }) 
    }

    bookmark(event){
        
        event.preventDefault();

        let slug = event.currentTarget.dataset.slug
        let icon = this.bookmarkTarget
        //console.log(icon);

        // /api/users/:id/bookmark
        axios.post(`/api/users/${slug}/bookmark`)
    
            .then(function(response){
        
                let status = response.data.status
                console.log(response.data);
                
                 switch(status){
                    
                    case '請先登入':
                         alert("請先登入!")
                         break;
    
                    case '收藏':
                        icon.classList.remove('far')
                        icon.classList.add('fas')
                        break
                    
                    case '取消收藏':
                        icon.classList.remove('fas')
                        icon.classList.add('far')
                        break
                 }

            })

            .catch(function(error){
                console.log(error);
            })
    }

}