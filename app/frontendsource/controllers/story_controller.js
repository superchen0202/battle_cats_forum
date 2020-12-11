import axios from 'axios'
import { Controller } from "stimulus"

export default class extends Controller {
    
    static targets = [ "likeCounter" ]
    
    addLike(event){

        event.preventDefault();
        //this.likeCounterTarget.innerHTML = 5;

        let slug = event.currentTarget.dataset.slug
        console.log(slug);

        axios.post(`/stories/${slug}/like`)
                
                .then(function(response){
                    console.log(response.data)
                })

                .catch(function(error){
                    console.log("error")
                })    
    }
    
}