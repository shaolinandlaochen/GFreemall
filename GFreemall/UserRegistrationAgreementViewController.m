//
//  UserRegistrationAgreementViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/7.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "UserRegistrationAgreementViewController.h"

@interface UserRegistrationAgreementViewController ()

@end

@implementation UserRegistrationAgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"用户协议");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    [self CreatView];
    // Do any additional setup after loading the view.
}
cancelClick
-(void)CreatView{
    autoSize
    UIScrollView *scroll=[[UIScrollView alloc]init];
    [self.view addSubview:scroll];
    scroll.sd_layout.leftSpaceToView(self.view, 20*autoSizeScaleX).rightSpaceToView(self.view, 20*autoSizeScaleX).topSpaceToView(self.view, (20*autoSizeScaleX)).bottomSpaceToView(self.view, 0);
    
    
    
    UILabel *lbl=[[UILabel alloc]init];
    lbl.textColor=[TheParentClass colorWithHexString:@"#292929"];
    lbl.text=@"一、确认与接纳\n\n“GFREEMALL”（http://www.gfreetrade.com）是GFM公司推出的基于全球互联网向用户提供集电子商务、社区服务及类金融服务为一体的综合性网站。“GFREEMALL”及其涉及到的产品、服务、相关软件的所有权和运营权归GFM公司所有，GFM公司享有对“GFREEMALL”上一切活动的监督、提示、检查、纠正及处罚权利。用户通过注册程序阅读本服务条款并点击“同意”或“接受”按钮完成注册，或以任何行为实际使用、享受“GFREEMALL”的服务，即表示用户与GFM公司已达成协议，自愿接受本服务条款的所有内容。如用户不同意本服务条款的条件，则不能使用GFM服务以及注册成为“GFREEMALL”用户。\n二、服务保护条款\n\n1、“GFREEMALL”服务仅供依法能够且有权订立具有法律约束力合约的自然人、法人及非法人组织使用。因此，用户应为具备完全民事行为能力的自然人，或依法成立、存续的法人或非法人组织。\n用户违反本项条件，“GFREEMALL”可随时、全权决定拒绝向其提供服务，若因此给“GFREEMALL”或第三方造成损失，用户承担全部赔偿责任。\n2、考虑到“GFREEMALL”产品及服务的特性，用户同意：\n（1）自备设备，包括PC、调制解调器及配备上网装置，负担上网和支付与此服务有关的通讯费用；\n（2）在参加“GFREEMALL”各类活动时以及“GFREEMALL”提出要求时，提供及时、详尽及准确的个人资料，包括但不限于姓名、性别、年龄、住址/住所地、通讯地址、联系电话、电子邮件地址等；\n（3） 实时更新注册资料，符合及时、详尽、准确的要求。\n3、用户在享用“GFREEMALL”各项服务的同时，同意接受GFM公司提供的各类信息服务，这些信息所涉及的内容包括以文字、图片、照片、音视频形式表现的各类订单信息、宣传信息、促销信息、商业信息以及GFM公司合作伙伴信息，该类信息的提供方式包括但不限于电子邮件、短信息。用户在“GFREEMALL”注册或实际使用“GFREEMALL”的服务，即表明用户已同意接受此项服务。若用户不希望接收来自“GFREEMALL”的邮件，则可通过回复邮件的方式按照提示自助完成退阅；若用户不希望接收来自“GFREEMALL”的短信，则可联系“GFREEMALL”客户服务部 协助处理。\n4、“GFREEMALL”为用户提供合法的、健康的产品及服务，但是用户应对其使用“GFREEMALL”自行承担责任及风险，GFM公司在任何情况下不就因使用或不能使用“GFREEMALL”提供的服务所发生的特殊的、意外的、直接或间接的损失承担赔偿责任。\n5、除非法律规定或者“GFREEMALL”明确承诺，“GFREEMALL”将不对所提供的商品的适用性或满足用户特定需求及目的进行任何明示或者默示的担保。请在购买前确认自身的需求，同时仔细阅读商品说明。\n6、用户在参与活动或交易过程中与其他会员发生纠纷时，一旦一方或双方共同提交“GFREEMALL”要求调处，则“GFREEMALL”有权根据单方判断做出调处决定，用户了解并同意接受“GFREEMALL”的判断和调处决定，该决定将对用户具有约束力。如用户未在限期内执行处理决定，则GFM公司有权暂停向其提供服务，暂时冻结其GFM账户内的资金，并采取进一步法律手段解决。\n7、不接受任何商业目的的注册和购买。“GFREEMALL”欢迎以使用为目的购买GFM产品，但不接受一切以商业为目的的商业行为，若用户利用“GFREEMALL”的服务、产品、活动从事任何商业行为，GFM公司有权采取取消订单、冻结或关闭账户、永久禁止注册等措施，并拒绝提供GFM公司承诺的正常售后服务（产品质量问题按照国家或地方相关法律法规执行）。如用户利用“GFREEMALL”的产品、服务或活动从事任何商业行为给GFM公司造成损失的，用户需承担赔偿责任，构成犯罪的，GFM公司有权提请国家主管部门追究其行政和刑事责任。\n三、用户使用基本规则\n\n1、特别提示用户，使用互联网必须遵守国家有关的政策和法律，包括刑法、国家安全法、保密法、计算机信息系统安全保护条例等，保护国家利益，保护国家安全，对于违法使用互联网络而引起的一切责任，由用户负全部责任。\n2、用户在申请使用“GFREEMALL”提供的网络服务时，必须向GFM公司提供准确的个人资料，如个人资料有任何变动，必须及时更新。如有合理理由怀疑用户提供的资料错误、不实、失效或不完整的，“GFREEMALL”有权向用户发出询问及/或要求改正的通知，并有权直接做出删除相应资料的处理，直至中止、终止对用户提供部分或全部服务。“GFREEMALL”对此不承担任何责任，用户将承担因此产生的任何直接或间接支出。\n3、用户可在“GFREEMALL”发布商品或服务信息、评论及其他信息，但 不得使用“GFREEMALL”服务发送或传播敏感信息和违反国家法律法规政策的信息，此类信息包括但不限于：\n（1）反对宪法所确定的基本原则的；\n（2）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；\n（3）损害国家荣誉和利益的；\n（4）煽动民族仇恨、民族歧视，破坏民族团结的；\n（5）破坏国家宗教政策，宣扬邪教和封建迷信的；\n（6）散布谣言，扰乱社会秩序，破坏社会稳定的；\n（7）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；\n（8）侮辱或者诽谤他人，侵害他人合法权益的；\n（9）含有法律、行政法规禁止的其他内容的。\n用户在发布商品、服务信息及使用“GFREEMALL”服务过程中，还必须遵循以下原则：\n（1）遵守中国有关的法律和法规；\n（2）不得为任何非法目的而使用网络服务系统，遵守所有与网络服务有关的网络协议、规定和程序；不得利用“GFREEMALL”网络服务系统进行任何可能对互联网的正常运转造成不利影响的行为；\n（3）不得进行任何未经“GFREEMALL”许可的商业广告行为；不得对“GFREEMALL”上的任何数据作商业性利用，包括但不限于在未经“GFREEMALL”事先书面同意的情况下，以复制、传播等任何方式使用“GFREEMALL”上展示的资料；\n（4）不得使用虚假、冒充他人或其他方的信息注册“GFREEMALL”后发布评论或其他内容；不得以虚构或歪曲事实的方式不当评价其他会员，不得采取不正当方式制造或提高自身的信用度，不得采取不正当方式制造或提高（降低）其他会员的信用度；\n（5）不得使用任何装置、软件或例行程序干预或试图干预“GFREEMALL”的正常运作或正在“GFREEMALL”上进行的任何交易、活动；不得采取任何将导致不合理的庞大数据负载加诸“GFREEMALL”网络设备的行动；\n（6）不得利用网络服务进行任何不利于GFM公司或“GFREEMALL”的行为。\n4、用户享有检举权，用户在使用“GFREEMALL”服务过程中若发现违法、违规、侵权或其他任何违反本服务条款的行为，有权通过专门的客服途径向GFM公司进行检举，GFM公司将通过对检举内容的核实采取相应的措施。用户保证其检举事项的真实性、公正性，同时尊重GFM公司对被检举事项的处置措施；被检举用户有权通过专门的客服途径进行辩解，但不影响GFM公司先行采取相应措施，GFM公司在接纳被检举用户的辩解后，将恢复对其的服务。GFM公司将对用户检举进行保密。\n5、用户违反本条“用户使用基本规则”，GFM公司有权视情节的严重采取警告、限期改正、暂停服务、取消订单、禁止交易、封闭帐号、永久禁止注册等措施，给GFM公司或第三方造成损失的，GFM公司有权采取一切合法的诉讼与非诉手段进行索赔；用户行为构成犯罪的，GFM公司有权通知和协助国家主管部门进行查处。\n四、账户、密码以及注册信息\n\n1、用户注册成功后，将拥有一个“GFREEMALL”专用帐号及相应的密码，该帐号和密码将成为用户登录“GFREEMALL”、使用“GFREEMALL”服务、进行交易、完成支付以及享受售后服务的凭证，该账户不能修改。\n2、每位用户只允许在“GFREEMALL”拥有一个有效账户，该账户经注册生效后不能注销，如有证据证明或GFM公司有理由相信用户存在恶意注册多个账户的情形，GFM公司有权采取取消订单、冻结或关闭账户等措施，给GFM公司造成损失的，用户承担赔偿责任。\n3、使用“GFREEMALL”服务过程中，用户有义务保管好个人账号及密码，并对他人使用私人计算机作出限制。用户不得以任何形式擅自转让或授权他人使用自己的“GFREEMALL”帐号及密码。如果因为用户管理不善造成帐号、密码等被复制或被盗用，相应损失由用户自行承担。同时，通过该用户的个人账户在“GFREEMALL”上发生的所有活动以及产生的责任，亦应由该用户承担。\n4、用户不得采用测试、欺骗等任何非法手段，盗取其他用户的账户信息或对他人进行骚扰。\n5、“GFREEMALL”承诺仅根据本网站服务目的使用用户个人信息。服务目的包括但不限于交易确认、交易支付、客户回访、政策更新、用户通知、发送促销信息、商业信息以及其他与交易和服务相关的辅助服务等。如用户认为“GFREEMALL”超范围使用了其个人信息，请立即与客服中心联系，“GFREEMALL”将核实处理。\n五、用户隐私保护\n\n尊重用户个人隐私是GFM公司的一项基本政策，因此，GFM公司一定不会向任何第三方披露、转让、出租或者出售交易用户名单、交易记录等涉及消费者个人信息的数据以及用户保存在GFM公司各项服务中的非公开内容，除非GFM公司在诚信基础上认为透露这些信息是必要的。\n1、对用户注册资料的保护\n用户可授权GFM公司向第三方透露其注册资料，否则GFM公司不会公开用户的姓名、住址、通信地址、电子邮箱、电话及帐号。除非：\n（1）事先获得用户明确授权后，用户要求GFM公司或授权某人通过电子邮件服务或其他方式透露这些信息；\n（2）相应的法律、法规要求以及按照有关政府主管部门的要求，需要GFM公司提供用户的个人资料；\n（3）为了维护公众和（或）“GFREEMALL”、GFM公司合法利益；\n（4）“GFREEMALL”可能会与第三方合作向用户提供相关的网络服务，在此情况下，如该第三方同意承担与“GFREEMALL”同等的保护用户隐私的责任，则“GFREEMALL”有权将用户的注册资料等提供给该第三方；\n（5）在不透露单个用户隐私资料的前提下，“GFREEMALL”有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。\n2、对用户保存、发布信息的保护\nGFM公司对用户在“GFREEMALL”服务中发布或保存的各类非公开信息进行保密，除非GFM公司基于诚信在以下情形下认为透露这些信息是必要的：\n（1）遵守有关法律规定，包括在国家有关机关查询时，提供用户在“GFREEMALL”上发布的信息、因交易和付款而保存在“GFREEMALL”的信息，以及这些信息产生的时间、互联网地址或者域名以及其上传至“GFREEMALL”的其他信息；\n（2）遵从“GFREEMALL”产品服务程序；\n（3）为保持维护GFM公司的知识产权；\n（4）在紧急情况下维护用户个人和社会大众的隐私安全；\n（5）其他诚信及必要的情况下。\n六、商品价格及价格变化\n\n1、产品的价格将在“GFREEMALL”官方网站上指明。这类信息可能随时更改且不发出任何通知。商品的价格包含了增值税，商品送达费用则另外结算，送达费用根据用户选择送货方式的不同而异。如果发生了意外情况，在确认了用户的订单后，由于供应商提价，税额变化引起的价格变化，或是由于网站的失误等造成商品价格变化，用户有权取消的订单，并以电子邮件或电话等方式通知“GFREEMALL”客服服务部。\n2、“GFREEMALL”将尽最大努力保证用户所购商品与网站上公布的价格一致，但价目表和声明并不构成要约。直至用户发出订单，“GFREEMALL”才能确认商品的价格，如果“GFREEMALL”发现错误定价，将采取下列措施之一：\n（1）如果某一商品的正确定价低于“GFREEMALL”的错误定价，则按照较低的定价向用户销售交付该商品。\n（2）如果某一商品的正确定价高于“GFREEMALL”的错误定价，“GFREEMALL”会根据情况决定，是否在交付前联系用户寻求指示, 或者取消订单并通知用户。\n七、订单与缺货\n\n1、有关产品的信息及产品的可获性将在“GFREEMALL”官方网站上指明。用户应在提交订单前仔细核实上述信息，订单提交成功后系统将自动向用户发送一封确认邮件。\n此后GFM公司将对用户的订单进行审核并在通过审核后安排配送。\n2、若用户订购的产品发生缺货，则“GFREEMALL”及用户均有权单方取消订单，并以有效方式通知对方。\n3、“GFREEMALL”将尽量保证产品信息及可获性的准确，但仍可能因人员操作、系统问题及其他不可抗原因产生错误，在此情况下“GFREEMALL”将按正确的信息和用户进行确认修改，用户有权取消订单或者按照正确的信息完成交易。\n4、若用户在一份订单里订购了多种商品并且“GFREEMALL”只给用户发出了其中一部分商品，用户应联系“GFREEMALL”客服中心，“GFREEMALL”将向用户退还该部分款项或者向用户补足剩余商品。\n八、发货与收货\n\n1、配送范围将在“GFREEMALL”官方网站公示，用户应仔细阅读并在每次下订单前再次进行确认，确保所提交的送货地址属于该范围之内，超出该范围的订购或配送要求，属于无效订单，“GFREEMALL”有权单方取消订单。\n2、在提交订单前，用户应再次确认配送地址，如果因为用户地址错误造成延期配送或不能配送的，用户自行承担责任，造成货物重复配送，GFM公司有权按照实际配送次数收取物流费用。\n3、收货人可以为用户本人也可以为本人以外的其他人。GFM公司将按照通过审核后的订单上所述的配送地址、收货人姓名和电话进行配送。如果收货人在配送过程中要求变更接收地址的，GFM公司视同已经过用户本人的同意。\n4、原则上收货人应当亲自接收，如遇特殊情况收货人可以与“GFREEMALL”客服中心联系申请由他人代为签收。如果配送地点属于办公区域，则前台人员代为签收视为已经经过用户的同意。大额订单进行配送签收时，GFM公司有权要求收货人出示有效身份证明。\n5、GFM公司尽量将配送时间控制在1-3天，如遇不可抗力因素，包括但不限于以下情况：\n⑴自然灾害，如地震、台风、洪水、旱灾、海啸等。\n⑵政府行为，主要是指当事人在订立合同以后，政府当局颁布新政策、法律和行政措施而导致合同不能履行。\n⑶社会异常事件，如战争、罢工、骚乱、交通管制等。\n⑷恶劣天气所导致无法或难以正常送货。GFM公司有权延迟配送时间。\n6、若用户无正当理由多次拒收货物，则“GFREEMALL”有权取消该用户以后的订单。情形恶劣的，“GFREEMALL”有权采取冻结、关闭账户，永久禁止注册等措施，并保留追究赔偿责任的权利。\n九、付款与退款\n\n1、付款方式将在“GFREEMALL”官方网站予以公示。用户应在确认订单时，选择付款方式，并严格按照已选择的方式付款。用户未能按照所选择的方式或所要求的时间完成付款的，“GFREEMALL”有权单方取消订单。\n2、退款方式将在“GFREEMALL”官方网站予以公示。因退货或换货商品缺货而产生的现金款项，“GFREEMALL”将退回至用户，退回方式视支付方式的不同而不同。用户应严格依据退款方式及退款周期收回退款。\n十、退换货\n\n退换货政策将在“GFREEMALL”官方网站予以公示。“GFREEMALL”将针对商品品类的不同实行不同的退换货政策和条件，用户在申请退换货前应仔细阅读并理解，同时严格按照相关流程和要求完成退换货。\n十一、特别授权\n\n用户完全理解并不可撤销地授予GFM公司及其关联公司下列权利：\n1、一旦用户向“GFREEMALL”、GFM公司及（或）其关联公司作出任何形式的承诺，且相关公司已确认用户违反了该承诺，则“GFREEMALL”有权立即按用户的承诺或协议约定的方式对用户的账户采取限制措施，包括中止或终止向用户提供服务，并公示相关公司确认的用户的违约情况。用户了解并同意，“GFREEMALL”无须就相关确认与用户核对事实，或另行征得用户的同意，且“GFREEMALL”无须就此限制措施或公示行为向用户承担任何的责任。\n2、一旦用户违反本协议，或与GFM公司签订的其他协议的约定，GFM公司有权以任何方式通知GFM公司关联公司，要求其对用户的权益采取限制措施，包括但不限于将用户账户内的款项支付给“GFREEMALL”指定的对象，要求关联公司中止、终止对该用户提供部分或全部服务，且在其经营或实际控制的任何网站公示用户的违约情况。\n十二、拒绝担保及责任限制\n\n1、除非另有明确的书面说明，“GFREEMALL”网站及其所包含的或以其它方式通过“GFREEMALL”提供给用户的全部信息、内容、材料、产品（包括软件）和服务，是由“GFREEMALL”在“按照现状”和“按照可提供”的基础上提供的。除非另有明确的书面说明，“GFREEMALL”不对网站的运营及网站上的信息、内容、材料、产品（包括软件）或服务作任何形式的、明示或默示的声明或担保（根据中华人民共和国法律另有规定的除外）；亦不对这些信息、内容、材料、产品（包括软件）和服务、或用户购买和使用产品引起的任何损害承担责任（除非根据中华人民共和国法律应承担责任的以外），包括但不限于直接、间接或附带的惩罚性和结果性的损害赔偿。用户明确同意在使用“GFREEMALL”服务时自担风险。\n2、除非法律法规明确要求，或出现以下情况，否则，“GFREEMALL”没有义务对所有用户的注册数据、交易行为以及与交易有关的其它事项进行事先审查：\n（1）“GFREEMALL”有合理的理由认为特定用户及具体交易事项可能存在重大违法或违约情形；\n（2）“GFREEMALL”有合理的理由认为用户在“GFREEMALL”网的行为涉嫌违法或不当。\n3、用户了解并同意，“GFREEMALL”及GFM公司不对因下述任一情况而导致用户的任何损害赔偿承担责任，包括但不限于利润、商誉、使用、数据等方面的损失或其它无形损失的损害赔偿 (无论“GFREEMALL”及GFM公司是否已被告知该等损害赔偿的可能性) ：\n（1）使用或未能使用“GFREEMALL”服务；\n（2）第三方未经批准的使用用户的账户或更改用户的数据；\n（3）用户对“GFREEMALL”服务的误解；\n（4）任何非因“GFREEMALL”及GFM公司的原因而引起的与“GFREEMALL”服务有关的其它损失。\n4、用户明白，在使用“GFREEMALL”提供的服务时可能存在来自任何他人的包括威胁性的、诽谤性的、令人反感的或非法的内容或行为，以及对他人权利的侵犯（包括但不限于知识产权、人身权）的风险，用户同意承担以上风险，GFM公司对此不作任何类型的担保。\n5、用户理解并同意，GFM公司及其关联公司并非司法机构，仅能以普通人的身份对证据进行鉴别，GFM公司及其关联公司对争议的调处完全是基于用户的委托，GFM公司及其关联公司无法保证争议处理结果符合用户的期望，也不对争议调处结论承担任何责任。如用户因此遭受损失，用户同意自行向受益人索偿。\n6、用户明白，使用“GFREEMALL”提供的服务涉及到Internet服务和电信增值服务，可能会受到各个环节不稳定因素的影响。因此服务存在因不可抗力（包括但不限于自然灾害、政府行为以及战争、罢工、动乱等社会异常现象）、计算机病毒或黑客攻击、国家相关行业主管部门及电信运营商的调整、系统不稳定、用户所在位置、用户关机以及其他任何技术、互联网络、通信线路原因等造成的服务中断或不能满足用户要求的风险。用户同意承担以上风险，GFM公司不作担保。对因此导致用户不能发送、上传和接受阅读消息、或接发错消息，或无法实现其他通讯条件，GFM公司不承担任何责任。\n十三、知识产权\n\n1、GFM公司对“GFREEMALL”上全部内容享有绝对的、完全的所有权及知识产权，或已取得权利人的合法授权，内容包括：文字、图片、图表、照片、软件、声音、图像，以及广告中的全部内容、“GFREEMALL”以通告形式发出的全部内容、本服务条款第二条“服务保护条款”第3款所涉及的各类信息。所有这些内容均受著作权、商标权、物权及其他知识产权和所有权法律的保护。用户只能在GFM公司和（或）权利人的授权下才能使用这些内容，而不能擅自复制、编辑、改编、传播这些内容，或对内容进行任何形式的权利申请，或创造与内容有关的派生产品。同时，这些内容不可以被用于任何可能引起消费者对“GFREEMALL”服务产生混淆或者贬低的商品或者服务上。\n2、未经GFM公司书面同意，用户不得用任何方式对“GFREEMALL”网站内容进行修改，也不得复制、下载“GFREEMALL”网页内容、数据、信息进行转售或商业利用。用户被授予有限的、可撤销的和非独家的权利建立连接到“GFREEMALL”主页的超链接，只要这个链接不以虚假、误导、贬低或其他方式侵害“GFREEMALL”的商品和服务。\n3、对于用户发布和保存在“GFREEMALL”上的内容，用户授予GFM公司及其关联公司独家的、全球通用的、永久的、免费的许可使用权利 (并有权在多个层面对该权利进行再授权)。此外，GFM公司及其关联公司有权(全部或部份地) 使用、复制、修订、改写、发布、翻译、分发、执行和展示用户的全部资料数据（包括但不限于注册资料、交易行为数据及全部展示于“GFREEMALL”的各类信息）或制作其派生作品，并以现在已知或日后开发的任何形式、媒体或技术，将上述信息纳入其它作品内。用户进一步确认，GFM公司对其内容的使用是基于用户对内容的合法性、合规性及权属做出的承诺和保证，GFM公司的使用不意味着GFM公司认可用户的观点或承诺对该内容承担任何责任，无论GFM公司是否对用户发布和保存的内容进行使用，用户均应独立的、完全的对其内容负责。若GFM公司因对内容的使用而遭受任何争议、索赔、指控，作为内容提供方的用户应对此承担全部责任，并赔偿GFM公司因此遭受的损失。\n十四、服务条款的修改及服务修订\n\n1、用户接受，随着市场环境、网络环境以及“GFREEMALL”自身发展，GFM公司会在必要时修改服务条款，服务条款一旦发生变动，“GFREEMALL”将会以站内公告、站内信、电子邮件或其他书面方式将修改后的条款予以公布或通知。\n2、用户接受，GFM公司为了保障公司业务发展和调整的自主权，拥有随时修改或中断服务而不需通知用户的权利，GFM公司行使修改或中断服务的权利不需对用户或任何第三方负责。用户必须在同意本条款的前提下，GFM公司才开始对用户提供服务。\n3、用户若反对任何服务条款的修改或服务的修订，或用户对后继的条款、服务有异议，或对GFM公司服务不满，用户享有以下权利：\n（1） 不再使用GFM公司和/或“GFREEMALL”的服务；\n（2） 书面通知GFM公司停止对其的服务。\n结束用户服务后，用户使用“GFREEMALL”服务的权利马上终止。从那时起，GFM公司不再对用户承担任何义务。\n4、一旦用户选择继续使用“GFREEMALL”服务，则表示用户已接受经修订的条款及服务，当用户与“GFREEMALL”发生争议时，应以最新的服务条款为准。除另行明确声明外，任何使“GFREEMALL”服务范围扩大或功能增强的新内容均受本条款约束。\n十五、违约责任承担\n\n1、如果用户未遵守本服务条款的任何一项，GFM公司有权立即终止提供一切服务，并保留通过法律手段追究责任的权利。\n2、用户同意支付因用户违反本服务条款或为纠正用户的违反行为所引起的律师费用、诉讼费用、公正费用、鉴定费用、执行费用等，以及因违反服务条款引起的损害赔偿费用。如用户的密码、账户被盗用，除非该事件因GFM公司的过错导致，否则用户应承担被盗用期间产生的一切责任和后果。\n3、“GFREEMALL”已经建立了规范的消费纠纷受理及解决机制，用户和GFM公司一致同意，有关本条款以及使用“GFREEMALL”服务产生的争议双方首先通过“GFREEMALL”专业客服部门进行友好协商沟通，并力求和解解决，当协商不能时，任何一方有权选择采取诉讼方式，并应由GFM公司所在地有管辖权的人民法院管辖。若有任何服务条款与法律相抵触，这些条款将按尽可能接近的方法重新解析，而其它条款则保持对双方产生法律效力和影响。\n十六、其他\n\n1、本服务条款以及与使用“GFREEMALL”服务相关的声明、说明、规则、政策、程序，构成“GFREEMALL”与用户之间有效的完整协议，将对用户持续有效，有效期至用户注销或者被取消账户、且停止一切使用“GFREEMALL”服务的行为后，但“GFREEMALL”与用户间已经产生的权利义务，仍对双方有约束力。\n2、GFM公司将视向用户所提供服务内容之特性，要求用户在注册GFM公司提供的有关服务时，遵守特定的条件和条款；如该特定条件和条款与以上服务条款有任何不一致之处，则以特定条件和条款为准。\n3、本服务条款中的任何条款无论因何种原因完全或部分无效或不具有执行力，其余条款仍应有效并且有约束力。\n4、本服务条款的标题、序号均为方便阅读而设定，不影响条款实际含义及其效力。\n5、本服务条款自公布及适用的当天生效，有效期持续至更新版本发布之时。\n";
    lbl.font=[UIFont systemFontOfSize:26*autoSizeScaleX];
    [scroll addSubview:lbl];
    CGSize size=[TheParentClass StringHeight:lbl.text Lblfont:26*autoSizeScaleX heightOfTheMinus:40*autoSizeScaleX];
    lbl.sd_layout.leftSpaceToView(scroll, 0).rightSpaceToView(scroll, 0).topSpaceToView(scroll, 0).autoHeightRatio(0);
    scroll.contentSize=CGSizeMake(0, size.height);
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end