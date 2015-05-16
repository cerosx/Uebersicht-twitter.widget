command: "php twitter.widget/tweet.php"

refreshFrequency: 50000

style: """
  
  size = 265px                

  width: size 
 

  height: 50px
  vertical-align: middle


  /*POSITION*/
  top: 11%
  left: 2%

  /*COLORS*/
  primaryColor = rgba(255,255,255,0.5)
  secondaryColor = rgba(0, 0, 0, 0.00)


  font-family: Helvetica
  font-weight: 100
  font-size: 16px

    
  #twitter
    width: 265px
    min-height: 80px
    margin-top: 10px
    margin-left -7px
    background-color: secondaryColor

  #t_inner
    padding: 20px 20px 15px 20px

  #account
    padding-left: 10px

  #twico
    float: left
    width: 40px
    height: 35px
    background: url('twitter.widget/twitter.png')
    opacity: 0.8

  #twname     
    float: left
    margin-left: 15px
    font-size: 20px
    font-weight: 100
    margin-top: 8px
    color: #fff
    opacity: 0.8

  #sep
    clear: both
    padding-top: 10px
    opacity: 0.7

  hr
    border: 0
    height: 1px
    background: primaryColor

  #twstats
    margin-top: 20px

  .tws
    float: left
    width: 50%        
    text-align: center
    color: #fff
    font-weight: 100
    font-size: 10px

  .twc
    font-size: 33px
    font-weight: 100
    opacity: 0.8

  #lasttweet
    padding-left: 5px
    padding-right: 5px
    color: #fff  
    font-size: 13px
    font-weight: 300
    line-height: 23px

  #lt
    width: 200px    
    max-height: 90px
    overflow: hidden
"""


render: (output) -> """
<div id="twitter">
    <div id="t_inner">    
        <div id ="account" align="center">
            <div id="twico"></div> 
            <div id="twname"></div>            
        </div>        
        <div id="sep"><hr></div>
        <div id="twstats">
            <div class="tws">TWEETS<br><div class="twc" id="stc"></div></div>
            <div class="tws">FOLLOWER<br><div class="twc" id="foc"></div></div>            
        </div>
        <div id="sep"><hr></div>
    </div>
</div>
"""


update: (output) ->
    if output != ""
        json = JSON.parse(output); 
        $('#twitter').show();
        $('#twname').text "@" + json['display_name']
        $('#stc').text json['statuses_count']
        $('#foc').text json['followers_count']
        $('#lt').text json['last_tweet']
    else
        $('#twitter').hide();
        
