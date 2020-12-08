import { Controller } from "stimulus"
//import axis from 'axios'
//去node module找

export default class extends Controller {
  static targets = [ "likeCount" ] //<span class= "likeCount">0</span>

  //0800 data: {action: 'story#addLike', slug: @story.slug }
  addLike(event){

    //stop超連結
    event.preventDefault()

    //1550
    //目前這個連結(現在被按的對象)上面有一個dataset，上面有一個slug
    let slug = event.currentTarget.dataset.slug

    //0825 for test
    //console.log("TEST")

    //0915 test2：按鈕 => count變動
    this.likeCountTarget.innerHTML ='OK!'
    

    //1039 API如何串接：按鈕被按時，應該往哪去？
    //設計完網址後(1200)： ==> /stories/id/like
    // 1213 需要一個controller跟一個action可以接這個東西


    //1350 對路徑做post
    
    //捕捉路徑的:id => 用slug抓，因為unique沒問題
    //1530 原始碼中slug的樣子
    //1620 抓到slug後，用字串串接的方式ˋ${slug}ˋ換進去
    axios.post(ˋ/stories/:id/likeˋ)
    
        //1404成功：當我打過去時會有回應回來，並根據回應在做相對應的事情
        .then(function(response){
          console.log(response.data)
        })

        //1434
        .catch(function(error){
          console.log(error)
        })

  }
}