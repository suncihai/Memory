//
//  ViewController.swift
//  回忆录
//
//  Created by suncihai on 16/6/3.
//  Copyright © 2016年 suncihai. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView:UIImageView!
    @IBOutlet weak var actorImageView:UIImageView!
    @IBOutlet weak var actor2ImageView:UIImageView!
    @IBOutlet weak var dialogueImageView:UIImageView!
    @IBOutlet weak var text:UITextView!
    @IBOutlet weak var Sakura1:UIWebView!
    @IBOutlet weak var Sakura2:UIWebView!
    @IBOutlet weak var Selection1:UIButton!
    @IBOutlet weak var Selection2:UIButton!
    @IBOutlet weak var Selection3:UIButton!
    @IBOutlet weak var EndLeftImage:UIImageView!
    @IBOutlet weak var EndRightImage:UIImageView!
    @IBOutlet weak var EndMiddleImage:UIImageView!
    @IBOutlet weak var EndTitleImage:UIImageView!
    
    var backgroundMusic:AVAudioPlayer?
    
    var StoryProcess:Int=0
    
    var Selection1Chosen:Bool=false
    var Selection2Chosen:Bool=false
    var Selection3Chosen:Bool=false
    
    var SwitchProcess:Bool=false
    var EndScene:Bool=false

    var ProcessArray=[0,9,30,48,57,79,85,90,103,122,126,138,148,154,162,169,186,194,205]
    var ProcessRotatedArray=[205,194,186,169,162,154,148,138,126,122,103,90,85,79,57,48,30,9,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundImageView.image=UIImage(named: "开始画面.jpg")
        Sakura1.opaque=false
        Sakura2.opaque=false
        
        Selection1.hidden=true
        Selection2.hidden=true
        Selection3.hidden=true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        view.addGestureRecognizer(tap)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.SwipeGesture(_:)))
        leftSwipe.direction = .Left
        view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.SwipeGesture(_:)))
        rightSwipe.direction = .Right
        view.addGestureRecognizer(rightSwipe)
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tapGesture(sender:UITapGestureRecognizer){
        
        switch StoryProcess {
        case 0:
            PlayMusic(3)
            SwitchBackGroundImage("地铁.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="真是个阳光明媚的一天啊～"
        case 1:
            SwitchActorImage("conan1.png")
            self.text.text="今天可以和悦姐姐玩一天啦～"
        case 2:
            self.text.text="想想就兴奋呢😝"
        case 3:
            self.text.text="之前查过天气预报"
        case 4:
            self.text.text="好像会下雷阵雨的说😂"
        case 5:
            self.text.text="不过不要紧啦，我是sun，有晴天的光环嘛，哈哈哈"
        case 6:
            self.text.text="好像到站啦，好快"
        case 7:
            self.text.text="快出去吧～"
        case 8:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 9:
            if(SwitchProcess){
                PlayMusic(3)
            }
            SwitchBackGroundImage("地铁口.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="还好没下雨～"
        case 10:
            SwitchActorImage("conan4.png")
            self.text.text="看看现在几点了呢"
        case 11:
            self.text.text="嗯嗯，十点都没到～"
        case 12:
            self.text.text="要不打个电话给悦姐姐呢？"
        case 13:
            SwitchActorImage("conan10.png")
            self.text.text="嘟嘟嘟..."
        case 14:
            self.text.text="嘟嘟嘟......"
        case 15:
            self.actorImageView.image = UIImage(named: "conan11.png")
            self.text.text="您所拨的电话无法接通，请稍后再拨"
        case 16:
            self.text.text="The phone you have called is out of service..."
        case 17:
            SwitchActorImage("conan7.png")
            self.text.text="嗯。。。"
        case 18:
            self.text.text="应该是还在地铁里吧"
        case 19:
            SwitchActorImage("conan4.png")
            self.text.text="那就发个消息试试吧"
        case 20:
            self.text.text="“我已经到啦，在地铁口等你噢～”"
        case 21:
            SwitchActorImage("conan2.png")
            self.text.text="那就慢慢等吧"
        case 22:
            SwitchActorImage("")
            self.text.text="过了十分钟"
        case 23:
            SwitchActorImage("lin1.png")
            self.text.text="“不好意思啊，有点晚到了呢”"
        case 24:
            SwitchActorImage("")
            self.text.text="只看见悦姐姐匆匆忙忙地跑了过来"
        case 25:
            SwitchActorImage("conan3.png")
            self.text.text="“没关系没关系，我也就刚到一会儿呢”"
        case 26:
            self.text.text="“那要不一起走吧？”"
        case 27:
            SwitchActorImage("lin1.png")
            self.text.text="“嗯嗯，好啊，那走吧～😊”"
        case 28:
            SwitchActorImage("")
            self.text.text="于是我们往中央公园走去"
        case 29:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 30:
            PlayMusic(5)
            SwitchBackGroundImage("喷泉.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="走了大概十几分钟就走到了中央公园"
        case 31:
            self.text.text="樱花还开得很茂盛，远远望去一片一片粉红煞是好看"
        case 32:
            SwitchActorImage("lin1.png")
            self.text.text="“哇，好好看的樱花🌸啊～”"
        case 33:
            self.text.text="“对了问你呀，这里的樱花和日本比起来哪个更好看啊？”"
        case 34:
            SwitchActorImage("conan8.png")
            self.text.text="“我去过上野公园和千鸟之渊，我觉得那里的樱花长得都很密集，规模很大，站在樱花林里的感觉很棒的说～”"
        case 35:
            self.text.text="“日本的花期也长呢，有三个星期左右，这里只有两个星期”"
        case 36:
            self.text.text="“不过这里的樱花也别有风味啦，也很好看的”"
        case 37:
            self.text.text="“哎对了，你上次说你很早以前去日本玩过，那时候看过樱花吗？”"
        case 38:
            SwitchActorImage("lin1.png")
            self.text.text="“我上次去的时候樱花已经没有啦，555”"
        case 39:
            self.text.text="“那时没有试穿过和服👘，一直有点小遗憾呢😌”"
        case 40:
            SwitchActorImage("conan5.png")
            self.text.text="“噢噢，以后还有机会的呀～”"
        case 41:
            self.text.text="“不过这里的樱花也别有风味啦，也很好看的”"
        case 42:
            SwitchActorImage("lin2.png")
            self.text.text="“嗯嗯，以后一定要再去日本玩次，穿和服～😝”"
        case 43:
            SwitchActorImage("conan2.png")
            self.text.text="“嗯，感觉今天来玩的人也不多呢～”"
        case 44:
            self.text.text="“人少真好，清净，哈哈哈”"
        case 45:
            self.text.text="“再往里面走走看吧？”"
        case 46:
            SwitchActorImage("lin1.png")
            self.text.text="“嗯嗯，走吧～”"
        case 47:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 48:
            if(SwitchProcess){
                PlayMusic(5)
            }
            SwitchBackGroundImage("樱花大道.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="往里面走了一会儿，便来到了一条宽敞的大道，两旁种着一排排的樱花树"
        case 49:
            self.text.text="四周围弥漫着樱花的芳香"
        case 50:
            SwitchActorImage("conan2.png")
            self.text.text="“想到了一句诗”"
        case 51:
            self.text.text="“山重水复疑无路，柳暗花明又一村”"
        case 52:
            self.text.text="“哈哈哈哈”"
        case 53:
            SwitchActorImage("lin1.png")
            self.text.text="“那再到前面去看看有没有个村？😂”"
        case 54:
            SwitchActorImage("conan3.png")
            self.text.text="“这个可以有。。。”"
        case 55:
            self.text.text="“去看看吧～”"
        case 56:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 57:
            PlayMusic(10)
            SwitchBackGroundImage("樱花树.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="走了不远，就如同走进了一片粉红的海洋"
        case 58:
            self.text.text="实在无法用语言来形容这美景"
        case 59:
            self.text.text="忽然一阵风刮了过来"
        case 60:
            SakuraFallAnimation(true)
            self.text.text="漫天的樱花飘扬了起来，彷佛在下一阵樱花雨"
        case 61:
            SwitchActorImage("lin1.png")
            self.text.text="“哇，这太美了”"
        case 62:
            self.text.text="落英飞舞樱花的影子洒在悦姐姐的身段上，一明一暗的对比，显得格外美丽动人。这大概就是人景合一的境界吧？"
        case 63:
            self.text.text="“帮我拍个照吧？😆”"
        case 64:
            SwitchActorImage("conan2.png")
            self.text.text="“好哒😊”"
        case 65:
            self.text.text="“我照相水平可是一流的噢～”"
        case 66:
            SwitchActorImage("lin4.png")
            self.text.text="“那就拜托你了哟😝”"
        case 67:
            self.text.text=""
            SwitchDialogueImage("")
        case 68:
            SwitchActorImage("")
            SwitchDialogueImage("对话框.png")
            self.text.text="随着相机的啪唧声，这一刻美好的景象被保存了下来"
        case 69:
            SwitchActorImage("lin1.png")
            self.text.text="“嗯果然拍得很好呢～谢谢啦～”"
        case 70:
            SwitchActorImage("conan2.png")
            self.text.text="“我拍的肯定好啊～”"
        case 71:
            self.text.text="“你也帮我拍一张吧？”"
        case 72:
            SwitchActorImage("lin1.png")
            self.text.text="“嗯好啊，你摆个pose吧”"
        case 73:
            SwitchActorImage("conan9.png")
            self.text.text="“真相只有一个！”"
        case 74:
            SwitchActorImage("lin1.png")
            self.text.text="“哈哈哈招牌动作都出来了啊”"
        case 75:
            self.text.text="“好拼😂😂😂”"
        case 76:
            SwitchActorImage("conan2.png")
            self.text.text="“爱拼才会赢嘛”"
        case 77:
            SwitchActorImage("")
            self.text.text="因为这里景色太美，我们在这里呆了好久"
        case 78:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 79:
            SakuraFallAnimation(false)
            PlayMusic(6)
            SwitchBackGroundImage("海边.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="等我们离开了樱花林，居然已经到了傍晚时分"
        case 80:
            SwitchActorImage("conan2.png")
            self.text.text="“已经傍晚了耶，要不我们去吃饭吧？”"
        case 81:
            SwitchActorImage("lin1.png")
            self.text.text="“可以啊，我们吃啥好呢？”"
        case 82:
            SwitchActorImage("conan1.png")
            self.text.text="“要不吃日料吧？我们都喜欢日料～哈哈哈”"
        case 83:
            SwitchActorImage("lin1.png")
            self.text.text="“好啊好啊，那我们走吧～”"
        case 84:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 85:
            if(SwitchProcess){
                PlayMusic(6)
            }
            SwitchBackGroundImage("餐厅外.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="步行了大约二十分钟，我们来到了一家看上去挺不错的日料店"
        case 86:
            self.text.text="这是个闹中取静的位置，不仔细看的话很难发现这家小店"
        case 87:
            SwitchActorImage("conan2.png")
            self.text.text="“那我们进去吧～”"
        case 88:
            SwitchActorImage("lin1.png")
            self.text.text="“嗯嗯～”"
        case 89:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 90:
            if(SwitchProcess){
                PlayMusic(6)
            }
            SwitchBackGroundImage("餐厅内.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="餐厅里面布置得也很有风格"
        case 91:
            self.text.text="显得也很有情调"
        case 92:
            SwitchActorImage("conan2.png")
            self.text.text="我看了看菜单"
        case 93:
            SwitchActorImage("conan2.png")
            self.text.text="“好像这个便当盒最划算啦”"
        case 94:
            SwitchActorImage("lin1.png")
            self.text.text="“是嘛，我看看”"
        case 95:
            self.text.text="“有不少选择哎，你选哪个啊”"
        case 96:
            SwitchActorImage("conan8.png")
            self.text.text="“我选炸鸡排便当吧”"
        case 97:
            self.text.text="“日本人喜欢在考试啊比赛前吃炸猪排炸鸡排，因为katsu在日语里是胜利的意思呢。其实为了讨个口彩，就和我们中国人喜欢在门上挂着倒的福一样”"
        case 98:
            SwitchActorImage("lin2.png")
            self.text.text="“你知道的还挺多哈”"
        case 99:
            self.text.text="“我就选这个鱼便当吧”"
        case 100:
            SwitchActorImage("conan2.png")
            self.text.text="“嗯，好滴～”"
        case 101:
            self.text.text="于是我选了炸鸡排便当，悦姐姐选了鱼便当"
        case 102:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 103:
            if(SwitchProcess){
                PlayMusic(6)
            }
            SwitchBackGroundImage("便当.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="我们的便当终于来了"
        case 104:
            self.text.text="看上去的确很丰盛的说"
        case 105:
            SwitchActorImage("conan2.png")
            self.text.text="“好像不错吖😝”"
        case 106:
            SwitchActorImage("lin1.png")
            self.text.text="“嗯嗯，那我开动啦”"
        case 107:
            self.text.text="“你日料理最喜欢哪个啊”"
        case 108:
            SwitchActorImage("conan2.png")
            self.text.text="“我最喜欢拉面啦”"
        case 109:
            self.text.text="“我在日本的时候，有时候一星期要吃四五次拉面，不吃就会觉得难受呢，哈哈哈”"
        case 110:
            SwitchActorImage("lin1.png")
            self.text.text="“那你觉得纽约这里的拉面肿么样呀”"
        case 111:
            SwitchActorImage("conan2.png")
            self.text.text="“我觉得一般般啊，一风堂和鸟人都很普通额，我对面的要求比较高，喜欢那种QQ的有弹性有嚼劲的面。”"
        case 112:
            SwitchActorImage("lin1.png")
            self.text.text="“我以前吃过一风堂和鸟人，排了好久的队。不过现在肯定不会排队去吃啦，哈哈”"
        case 113:
            SwitchActorImage("conan2.png")
            self.text.text="“嗯嗯”"
        case 114:
            SwitchActorImage("lin1.png")
            self.text.text="“这次去夏威夷，乌克丽丽花了十五分钟就会弹四和弦啦～”"
        case 115:
            SwitchActorImage("conan2.png")
            self.text.text="“这么厉害啊！”"
        case 116:
            self.text.text="“对呢，之前听你说起过你还会弹古筝的说”"
        case 117:
            self.text.text="“那你古筝也很快就学会了吗？”"
        case 118:
            SwitchActorImage("lin1.png")
            self.text.text="“嗯，对啊，我高山流水一个月就学会了呢”"
        case 119:
            SwitchActorImage("conan3.png")
            self.text.text="“感觉要膜拜你了😂”"
        case 120:
            SwitchActorImage("lin1.png")
            self.text.text="“还好啦～～”"
        case 121:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 122:
            if(SwitchProcess){
                PlayMusic(6)
            }
            SwitchBackGroundImage("餐厅内.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="和悦姐姐边吃边聊，时间过得好快，我们差不多吃完了"
        case 123:
            SwitchActorImage("conan2.png")
            self.text.text="“时间看起来差不多呢，可以一边散步一边往电影院走呢”"
        case 124:
            SwitchActorImage("lin1.png")
            self.text.text="“嗯嗯那快走吧～”"
        case 125:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 126:
            PlayMusic(1)
            SwitchBackGroundImage("街道2.bmp")
            SwitchDialogueImage("对话框.png")
            self.text.text="于是我们走出了餐厅，天色已经变暗"
        case 127:
            self.text.text="路上行人也越来越多，可能是夜生活刚刚开始吧？"
        case 128:
            SwitchActorImage("lin1.png")
            self.text.text="“每次走在曼哈顿街头看夜景总是看不腻呢”"
        case 129:
            SwitchActorImage("conan7.png")
            self.text.text=""
            
            let longPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPressGesture))
            longPress.minimumPressDuration=1.5
            
            view.addGestureRecognizer(longPress)
            
            SwitchDialogueImage("")
            Selection1.hidden=false
            Selection2.hidden=false
            
            Selection1.setImage(UIImage(named: "button1_1.png"), forState: UIControlState.Normal)
            Selection1.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")
            Selection2.setImage(UIImage(named: "button1_2.png"), forState: UIControlState.Normal)
            Selection2.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")
            
            for gesture in view.gestureRecognizers!{
                if let recognizer = gesture as? UITapGestureRecognizer{
                    view.removeGestureRecognizer(recognizer)
                }
            }
            
            for gesture in view.gestureRecognizers!{
                if let recognizer = gesture as? UISwipeGestureRecognizer{
                    view.removeGestureRecognizer(recognizer)
                }
            }

        case 130:
            if(Selection1Chosen){
                SwitchActorImage("lin2.png")
                self.text.text="“你好贫嘴啊😌”"
            }
            if(Selection2Chosen){
                SwitchActorImage("lin2.png")
                self.text.text="“我脸上有什么东西吗？还是你想说什么呀？”"
            }
            if(Selection3Chosen){
                SwitchActorImage("lin2.png")
                self.text.text="“你这样说人家要害羞的啦😳😳😳”"
            }
        case 131:
            if(Selection1Chosen){
                SwitchActorImage("conan3.png")
                self.text.text="“我很理性的，只是叙述事实而已啦”"
            }
            if(Selection2Chosen){
                SwitchActorImage("conan2.png")
                self.text.text="还是一直看着悦姐姐"
            }
            if(Selection3Chosen){
                SwitchActorImage("conan3.png")
                self.text.text="“金牛座很专一的呢，喜欢的东西不会腻的呀～”"
            }
        case 132:
            if(Selection1Chosen){
                SwitchActorImage("lin1.png")
                self.text.text="“😌😌😌😌😌😌😌😌”"
            }
            if(Selection2Chosen){
                SwitchActorImage("lin1.png")
                self.text.text="悦姐姐拿手在我面前晃了晃"
            }
            if(Selection3Chosen){
                SwitchActorImage("lin1.png")
                self.text.text="“嗯嗯！对的！金牛座很专一的！！😄😄😄”"
            }
        case 133:
            if(Selection1Chosen){
                SwitchActorImage("lin1.png")
                self.text.text="“看来金牛座都很理性哇，哈哈哈😊”"
            }
            if(Selection2Chosen){
                SwitchActorImage("lin1.png")
                self.text.text="“你没事吧？”"
            }
            if(Selection3Chosen){
                SwitchActorImage("lin1.png")
                self.text.text="“所以你不会看腻对吧？哈哈哈哈哈”"
            }
        case 134:
            if(Selection1Chosen){
                SwitchActorImage("conan1.png")
                self.text.text="“所以我喜欢金牛座呀～”"
                Selection1Chosen=false
            }
            if(Selection2Chosen){
                SwitchActorImage("conan1.png")
                self.text.text="“嗯，没事没事，发了会儿呆呢”"
                Selection2Chosen=false
            }
            if(Selection3Chosen){
                SwitchActorImage("conan1.png")
                self.text.text="“哈哈当然看不腻了～”"
                Selection3Chosen=false
            }
        case 135:
            SwitchActorImage("lin1.png")
            self.text.text="“快走吧，电影快开始了的说～”"
        case 136:
            SwitchActorImage("conan2.png")
            self.text.text="“嗯嗯～”"
        case 137:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 138:
            PlayMusic(3)
            SwitchBackGroundImage("电影院.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="到了电影院的时候，还在放广告"
        case 139:
            SwitchActorImage("conan2.png")
            self.text.text="“还好我们早到啦”"
        case 140:
            SwitchActorImage("lin1.png")
            self.text.text="“嗯嗯”"
        case 141:
            SwitchActorImage("conan2.png")
            self.text.text="“我之前看预告，有个宠物的秘密好像很有趣的”"
        case 142:
            SwitchActorImage("lin1.png")
            self.text.text="“这次的愤怒的小鸟也应该很好看的呀～”"
        case 143:
            SwitchActorImage("conan3.png")
            self.text.text="“那下次宠物的秘密也一起看吧😝”"
        case 144:
            SwitchActorImage("lin2.png")
            self.text.text="“好呀好呀～”"
        case 145:
            SwitchActorImage("conan1.png")
            self.text.text="“嗯那说定了噢～”"
        case 146:
            SwitchActorImage("lin1.png")
            self.text.text="“😌😌😌😌😌😌”"
        case 147:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 148:
            if(SwitchProcess){
                PlayMusic(3)
            }
            SwitchBackGroundImage("黑背景.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="四周渐渐变黑，电影开始上映了"
        case 149:
            self.text.text="愤怒的小鸟讲述了一群小鸟和一群绿猪之间的趣事"
        case 150:
            self.text.text="情节虽然简单但是构思不错，搞笑地方也很多"
        case 151:
            self.text.text="悦姐姐也一直在乐呵呵地笑"
        case 152:
            self.text.text="还是挺好看哒"
        case 153:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 154:
            PlayMusic(1)
            SwitchBackGroundImage("商业走廊.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="伴随着笑声，电影结束了"
        case 155:
            SwitchActorImage("conan3.png")
            self.text.text="“愤怒的小鸟真好看啊～”"
        case 156:
            SwitchActorImage("lin2.png")
            self.text.text="“嗯嗯！真的很好看”"
        case 157:
            self.text.text="“很适合两个大龄儿童在六一儿童节看呢，哈哈哈哈”"
        case 158:
            SwitchActorImage("conan3.png")
            self.text.text="“哈哈哈哈哈”"
        case 159:
            SwitchActorImage("conan2.png")
            self.text.text="“还有点时间，要不再在附近逛逛吧😝”"
        case 160:
            SwitchActorImage("lin1.png")
            self.text.text="“可以啊，正好散散步呢～”"
        case 161:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 162:
            if(SwitchProcess){
                PlayMusic(1)
            }
            SwitchBackGroundImage("游戏厅.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="电影院旁边有一家游戏厅dave and busters"
        case 163:
            self.text.text="很有没来过游戏厅了呢"
        case 164:
            SwitchActorImage("conan2.png")
            self.text.text="“你电动打得好吗？”"
        case 165:
            SwitchActorImage("lin1.png")
            self.text.text="“只能算一般般呢😂”"
        case 166:
            SwitchActorImage("conan2.png")
            self.text.text="“我也是呢，那再去其他地方看看吧～”"
        case 167:
            SwitchActorImage("lin1.png")
            self.text.text="“嗯嗯～”"
        case 168:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 169:
            if(SwitchProcess){
                PlayMusic(1)
            }
            SwitchBackGroundImage("服装店.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="于是我们又来到了一家服装店"
        case 170:
            self.text.text="只见悦姐姐在仔细地打量一件衣服"
        case 171:
            SwitchActorImage("conan2.png")
            self.text.text="“你喜欢这件衣服啊～”"
        case 172:
            SwitchActorImage("lin1.png")
            self.text.text="“嗯，我觉得不错啦，你觉得怎么样呀？”"
        case 173:
            SwitchActorImage("conan7.png")
            self.text.text=""
            SwitchDialogueImage("")
            
            Selection1.hidden=false
            Selection2.hidden=false
            
            Selection1.setImage(UIImage(named: "button2_1.png"), forState: UIControlState.Normal)
            Selection1.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")
            Selection2.setImage(UIImage(named: "button2_2.png"), forState: UIControlState.Normal)
            Selection2.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")
            
            for gesture in view.gestureRecognizers!{
                if let recognizer = gesture as? UITapGestureRecognizer{
                    view.removeGestureRecognizer(recognizer)
                }
            }
            
            for gesture in view.gestureRecognizers!{
                if let recognizer = gesture as? UISwipeGestureRecognizer{
                    view.removeGestureRecognizer(recognizer)
                }
            }
        case 174:
            if(Selection1Chosen){
                SwitchActorImage("lin2.png")
                self.text.text="“是嘛？”"
            }
            if(Selection2Chosen){
                SwitchActorImage("lin2.png")
                self.text.text="“那我试穿咯～等一下下哈～”"
            }
        case 175:
            if(Selection1Chosen){
                SwitchActorImage("conan1.png")
                self.text.text="“当然啦，我很有眼光的呀～”"
            }
            if(Selection2Chosen){
                SwitchActorImage("")
                self.text.text="悦姐姐进了更衣室"
            }
        case 176:
            if(Selection1Chosen){
                SwitchActorImage("lin1.png")
                self.text.text="“那我就信你咯？”"
            }
            if(Selection2Chosen){
                SwitchActorImage("lin5.png")
                self.text.text="“怎么样呀？好看吗？”"
            }
        case 177:
            if(Selection1Chosen){
                SwitchActorImage("conan1.png")
                self.text.text="“相信我，没错滴”"
                Selection1Chosen=false
                StoryProcess += 5
            }
            if(Selection2Chosen){
                SwitchDialogueImage("")
                self.text.text=""
            }
        case 178:
            if(Selection2Chosen){
                SwitchActorImage("conan2.png")
                SwitchDialogueImage("对话框.png")
                self.text.text="“好看的我都不知道怎么形容了”"
            }
        case 179:
            if(Selection2Chosen){
                self.text.text="“美得不要不要的”"
            }
        case 180:
            if(Selection2Chosen){
                SwitchActorImage("")
                SwitchActor2Image("lin6.png")
                self.text.text="“哇！真的那么好看嘛？😝”"
            }
        case 181:
            if(Selection2Chosen){
                self.text.text="悦姐姐突然做了个鬼脸"
            }
        case 182:
            if(Selection2Chosen){
                SwitchActorImage("conan3.png")
                SwitchActor2Image("")
                self.text.text="“嗯嗯，很符合你的气质呢～”"
                Selection2Chosen=false
            }
        case 183:
            SwitchActorImage("lin2.png")
            self.text.text="“那我就买这件衣服啦～”"
        case 184:
            SwitchActorImage("conan2.png")
            self.text.text="“嗯嗯～那我们走吧～”"
        case 185:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 186:
            if(SwitchProcess){
                PlayMusic(1)
            }
            SwitchBackGroundImage("河边夜景.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="和悦姐姐一路说说笑笑，不知不觉走到了河边"
        case 187:
            self.text.text="这里好像很幽静，也看不到什么人"
        case 188:
            SwitchActorImage("conan1.png")
            self.text.text="“要不我们去河边看看吧？”"
        case 189:
            self.text.text="悦姐姐好像没回应"
            SwitchActorImage("")
        case 190:
            SwitchActorImage("conan2.png")
            self.text.text="我见悦姐姐没回应，抬头一看，并没看到悦姐姐的身影"
        case 191:
            SwitchActorImage("conan7.png")
            self.text.text="大概刚才我没注意的时候走到其他地方了吧"
        case 192:
            self.text.text="去周围找找吧"
        case 193:
            self.text.text=""
            SwitchActorImage("")
            SwitchDialogueImage("")
        case 194:
            PlayMusic(2)
            SwitchBackGroundImage("曼哈顿夜景.jpg")
            SwitchDialogueImage("对话框.png")
            self.text.text="我来到了河边"
        case 195:
            self.text.text="终于在河边的眺望台找到了悦姐姐"
        case 196:
            SwitchActorImage("lin1.png")
            self.text.text="皎洁的月光泻在悦姐姐身上"
        case 197:
            self.text.text="煞是好看"
        case 198:
            self.text.text="“你来了啊，我刚才被这里景色吸引了，不知不觉就走到这里来啦～”"
        case 199:
            self.text.text="“不好意思呢，让你担心了呢”"
        case 200:
            SwitchActorImage("conan2.png")
            self.text.text="“太美了，我再帮你拍张照吧”"
        case 201:
            SwitchActorImage("lin2.png")
            self.text.text="“那就麻烦照相大师啦～”"
        case 202:
            self.text.text="“茄子～”"
        case 203:
            self.text.text=""
            SwitchDialogueImage("")
        case 204:
            EndScene=true
            SwitchBackGroundImage("")
            SwitchActorImage("")
        case 205:
            PlayMusic(9)
            EndScene=false
            SwitchBackGroundImage("黑背景.jpg")
        case 206:
            SwitchEndLeftImage("结尾1.PNG")
            SwitchEndRightImage("标题1.png")
        case 207:
            SwitchEndLeftImage("标题2.png")
            SwitchEndRightImage("结尾3.PNG")
        case 208:
            SwitchEndLeftImage("结尾2.PNG")
            SwitchEndRightImage("标题3.png")
        case 209:
            SwitchEndLeftImage("标题4.png")
            SwitchEndRightImage("结尾4.PNG")
        case 210:
            SwitchEndLeftImage("结尾5.PNG")
            SwitchEndRightImage("标题5.png")
        case 211:
            SwitchEndLeftImage("")
            SwitchEndRightImage("")
            SwitchEndMiddleImage("结尾6.PNG")
            SwitchEndTitleImage("标题6.png")
        case 212:
            EndScene=true
            SwitchEndMiddleImage("")
            SwitchEndTitleImage("")
        default:
            break
        }
        StoryProcess += 1
        SwitchProcess=false
    }
    
    func SwipeGesture(sender:UISwipeGestureRecognizer){
        SwitchActorImage("")
        SwitchActor2Image("")
        SwitchDialogueImage("")
        SwitchEndLeftImage("")
        SwitchEndRightImage("")
        SwitchEndMiddleImage("")
        SwitchEndTitleImage("")
        self.text.text=""
        SwitchProcess=true
        EndScene=false
        
        if(sender.direction == .Left){
            for process in ProcessRotatedArray{
                if(process<StoryProcess){
                    StoryProcess=process
                    break
                }
            }
        }
        if(sender.direction == .Right){
            for process in ProcessArray{
                if(process>StoryProcess){
                    StoryProcess=process
                    break
                }
            }
        }
    }
    
    func longPressGesture(sender:UILongPressGestureRecognizer){
        Selection3.hidden=false
        
        Selection3.setImage(UIImage(named: "button1_3.png"), forState: UIControlState.Normal)
        Selection3.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")

    }
    
    func tapTransition(subtype:String)->CATransition{
        let transfer = CATransition()
        
        let types = [kCATransitionFade]
        let type = types[Int(arc4random()%1)]
        
        transfer.type=type
        NSLog("%@",type)
        transfer.subtype=subtype
        if(EndScene){
           transfer.duration=7.0
        }else{
           transfer.duration=0.8
        }

        
        return transfer
    }
    
    func setupAudioPlayerWithFile(file:NSString,type:NSString)->AVAudioPlayer?{
        let path=NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url=NSURL.fileURLWithPath(path!)
        
        var audioPlayer:AVAudioPlayer?
        
        do{
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        }catch {
            
        }
        
        audioPlayer?.numberOfLoops = -1
        
        return audioPlayer
    }
    
    func PlayMusic(musicpicker:Int){
        if(musicpicker==1){
            if let backgroundMusic = self.setupAudioPlayerWithFile("memory", type: "mp3"){
                self.backgroundMusic = backgroundMusic
            }
        }
        if(musicpicker==2){
            if let backgroundMusic = self.setupAudioPlayerWithFile("moonlight theme", type: "mp3"){
                self.backgroundMusic = backgroundMusic
            }
        }
        if(musicpicker==3){
            if let backgroundMusic = self.setupAudioPlayerWithFile("mori lan theme", type: "mp3"){
                self.backgroundMusic = backgroundMusic
            }
        }
        if(musicpicker==4){
            if let backgroundMusic = self.setupAudioPlayerWithFile("small giant", type: "mp3"){
                self.backgroundMusic = backgroundMusic
            }
        }
        if(musicpicker==5){
            if let backgroundMusic = self.setupAudioPlayerWithFile("white angels", type: "mp3"){
                self.backgroundMusic = backgroundMusic
            }
        }
        if(musicpicker==6){
            if let backgroundMusic = self.setupAudioPlayerWithFile("date theme1", type: "mp3"){
                self.backgroundMusic = backgroundMusic
            }
        }
        if(musicpicker==7){
            if let backgroundMusic = self.setupAudioPlayerWithFile("detective group", type: "mp3"){
                self.backgroundMusic = backgroundMusic
            }
        }
        if(musicpicker==8){
            if let backgroundMusic = self.setupAudioPlayerWithFile("kogoro", type: "mp3"){
                self.backgroundMusic = backgroundMusic
            }
        }
        if(musicpicker==9){
            if let backgroundMusic = self.setupAudioPlayerWithFile("light of hope", type: "mp3"){
                self.backgroundMusic = backgroundMusic
            }
        }
        if(musicpicker==10){
            if let backgroundMusic = self.setupAudioPlayerWithFile("flying pigeons", type: "mp3"){
                self.backgroundMusic = backgroundMusic
            }
        }
        backgroundMusic?.play()
        
    }
    
    func SwitchBackGroundImage(ImageName:String){
        self.backgroundImageView.image = UIImage(named: ImageName)
        self.backgroundImageView.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")
    }
    
    func SwitchActorImage(ImageName:String){
        self.actorImageView.image = UIImage(named: ImageName)
        self.actorImageView.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")
    }
    
    func SwitchActor2Image(ImageName:String){
        self.actor2ImageView.image = UIImage(named: ImageName)
        self.actor2ImageView.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")
    }
    
    func SwitchDialogueImage(ImageName:String){
        self.dialogueImageView.image = UIImage(named: ImageName)
        self.dialogueImageView.layer.addAnimation(tapTransition(kCATransitionMoveIn), forKey: "tap")
    }
    
    func SwitchEndLeftImage(ImageName:String){
        self.EndLeftImage.image=UIImage(named: ImageName)
        self.EndLeftImage.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "ta[")
    }
    
    func SwitchEndRightImage(ImageName:String){
        self.EndRightImage.image=UIImage(named: ImageName)
        self.EndRightImage.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "ta[")
    }
    
    func SwitchEndMiddleImage(ImageName:String){
        self.EndMiddleImage.image=UIImage(named: ImageName)
        self.EndMiddleImage.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "ta[")
    }
    
    func SwitchEndTitleImage(ImageName:String){
        self.EndTitleImage.image=UIImage(named: ImageName)
        self.EndTitleImage.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "ta[")
    }
    
    func SakuraFallAnimation(AnimaOn:Bool){
        if(AnimaOn==true){
            let filePath = NSBundle.mainBundle().pathForResource("sakura", ofType: "gif")
            let gif = NSData(contentsOfFile: filePath!)
        
            Sakura1.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL: NSURL())
            Sakura1.userInteractionEnabled=false
            self.view.addSubview(Sakura1)
            
            Sakura2.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL: NSURL())
            Sakura2.userInteractionEnabled=false
            self.view.addSubview(Sakura2)
        }else{
            self.Sakura1.removeFromSuperview()
            self.Sakura2.removeFromSuperview()
        }
    }
    
    @IBAction func Button1Selected(){
        Selection1Chosen=true
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        view.addGestureRecognizer(tap)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.SwipeGesture(_:)))
        leftSwipe.direction = .Left
        view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.SwipeGesture(_:)))
        rightSwipe.direction = .Right
        view.addGestureRecognizer(rightSwipe)
        
        Selection1.hidden=true
        Selection1.setImage(UIImage(named: ""), forState: UIControlState.Normal)
        Selection1.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")
        Selection2.hidden=true
        Selection2.setImage(UIImage(named: ""), forState: UIControlState.Normal)
        Selection2.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")
        Selection3.hidden=true
        Selection3.setImage(UIImage(named: ""), forState: UIControlState.Normal)
        Selection3.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")
        
        for gesture in view.gestureRecognizers!{
            if let recognizer = gesture as? UILongPressGestureRecognizer{
                view.removeGestureRecognizer(recognizer)
            }
        }
        
        if(StoryProcess==130){
            SwitchDialogueImage("对话框.png")
            SwitchActorImage("conan8.png")
            self.text.text="夜景是很美，悦姐姐更美"
            
            StoryProcess = 130
        }
        if(StoryProcess==174){
            SwitchDialogueImage("对话框.png")
            SwitchActorImage("conan8.png")
            self.text.text="这件衣服很好看哇！"
            
            StoryProcess = 174
        }

    }
    
    @IBAction func Button2Selected(){
        Selection2Chosen=true
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        view.addGestureRecognizer(tap)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.SwipeGesture(_:)))
        leftSwipe.direction = .Left
        view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.SwipeGesture(_:)))
        rightSwipe.direction = .Right
        view.addGestureRecognizer(rightSwipe)
        
        Selection1.hidden=true
        Selection1.setImage(UIImage(named: ""), forState: UIControlState.Normal)
        Selection1.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")
        Selection2.hidden=true
        Selection2.setImage(UIImage(named: ""), forState: UIControlState.Normal)
        Selection2.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")
        Selection3.hidden=true
        Selection3.setImage(UIImage(named: ""), forState: UIControlState.Normal)
        Selection3.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")
        
        for gesture in view.gestureRecognizers!{
            if let recognizer = gesture as? UILongPressGestureRecognizer{
                view.removeGestureRecognizer(recognizer)
            }
        }
        
        if(StoryProcess==130){
            SwitchDialogueImage("对话框.png")
            SwitchActorImage("conan2.png")
            self.text.text="我于是一直看着悦姐姐"
            
            StoryProcess = 130
        }
        if(StoryProcess==174){
            SwitchDialogueImage("对话框.png")
            SwitchActorImage("conan2.png")
            self.text.text="你可以试穿一下啊～"
            
            StoryProcess = 174
        }
    }
    
    @IBAction func Button3Selected(){
        Selection3Chosen=true
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        view.addGestureRecognizer(tap)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.SwipeGesture(_:)))
        leftSwipe.direction = .Left
        view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.SwipeGesture(_:)))
        rightSwipe.direction = .Right
        view.addGestureRecognizer(rightSwipe)
        
        Selection1.hidden=true
        Selection1.setImage(UIImage(named: ""), forState: UIControlState.Normal)
        Selection1.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")
        Selection2.hidden=true
        Selection2.setImage(UIImage(named: ""), forState: UIControlState.Normal)
        Selection2.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")
        Selection3.hidden=true
        Selection3.setImage(UIImage(named: ""), forState: UIControlState.Normal)
        Selection3.layer.addAnimation(tapTransition(kCATransitionFade), forKey: "tap")
        
        SwitchDialogueImage("对话框.png")
        SwitchActorImage("conan3.png")
        self.text.text="看夜景会腻，看悦姐姐不会腻"
        
        for gesture in view.gestureRecognizers!{
            if let recognizer = gesture as? UILongPressGestureRecognizer{
                view.removeGestureRecognizer(recognizer)
            }
        }
        
        StoryProcess = 130
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

