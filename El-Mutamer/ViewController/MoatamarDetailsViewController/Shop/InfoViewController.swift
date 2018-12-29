//
//  SearchViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/22/18.
//  Copyright © 2018 Tantaservices. All rights reserved.


import UIKit

class InfoViewController: UIViewController {
    
    let infoTextView: UITextView = {
        let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 0
        txt.layer.cornerRadius = 0.0
        txt.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        txt.textAlignment = .right
        txt.isEditable = false
        txt.textColor = .black
        txt.font = UIFont.CairoSemiBold(of: 16)
        //txt.text = "يمتلك السلاح النووي قوة مدمرة هائلة تنتج عن تفاعلات الانشطار النووي أو الانشطار المصحوب بالاندماج النووي معًا. بعد الاكتشافات العلمية التي حدثت خلال ثلاثينيات القرن العشرين، تعاونت الولايات المتحدة والمملكة المتحدة وكندا خلال الحرب العالمية الثانية في ما كان يسمى بمشروع مانهاتن لمواجهة برنامج التسلح النووي الألماني المحتمل. في أغسطس 1945، ألقيت قنبلتا انشطار نووي على اليابان، وهي الحالة القتالية الوحيدة التي استخدم فيها السلاح النووي. بعد فترة وجيزة، بدأ الاتحاد السوفيتي تطوير مشروعه الذري الخاص، ولم تمر فترة طويلة بعد ذلك، وطوّرت البلدان أسلحة انصهار أكثر قوة عرفت باسم «القنابل الهيدروجينية». لم يدعُ الحلفاء الاتحاد السوفيتي للمشاركة في تطوير السلاح الجديد. خلال الحرب، وصلت للسوفييت معلومات من جواسيس متطوعين مشاركين في مشروع مانهاتن حول المشروع، إضافة إلى مراقبة الفيزيائي النووي السوفيتي إيجور خرشاتوف بعناية لأسلحة الحلفاء. لذا، لم يتفاجأ ستالين حين أخبره ترومان في مؤتمر بوتسدام أنه يمتلك سلاحًا جديدًَا قويًّا. مما جعل تروان يُصدم بعدم اهتمام ستالين. كان جواسيس السوفييت في المشروع من المتطوعين، ولم يكن منهم أحدًا من المواطنين السوفييت. كان كلاوس فوكس أبرز هؤلاء الجواسيس، وهو عالم فيزياء نظرية ألماني مهاجر شارك سابقًا في البرنامج النووي البريطاني، وكان ضمن البعثة البريطانية إلى لوس ألاموس. كان كلاوس من المشاركين بفعالية في إنتاج السلاح الجديد، ونقل تجربة ترينيتي إلى السوفييت. في السنوات التي تلت الحرب، أصبحت قضية من له أحقية امتلاك الأسلحة النووية مثار اهتمام دولي. ونادى معظم العلماء الذين شاركوا في صنع القنبلة في لوس ألاموس إلى المراقبة الدولية للطاقة الذرية، سواء عن طريق منظمات دولية أو بتشارك المعلومات بين القوى العظمى، ولكن لانعدام الثقة في نوايا الاتحاد السوفيتي، عمل صناع القرار الأمريكيون على تأمين احتكار السلاح النووي الأمريكي. دعا برنارد باروخ في هيئة الأمم المتحدة الناشئة للتحكم الدولي في السلاح النووي، ولكن كان من الواضح للأمريكيين والسوفيت أنها محاولة لتقويض جهود السوفييت في هذا المجال. في سنة 1946 م، أسس الأمريكيون هيئة الطاقة الذرية الأمريكية المدنية لتتولى تطوير الأسلحة النووية بدلاً من القيادة العسكرية، ولتطوّر استخدامات الطاقة النووية. وظّفت الهيئة العديد من الشركات الخاصة لتشغيل اليورانيوم والثوريوم، وفي المهام العسكرية العاجلة لتطوير القنابل. كانت تدابير السلامة في العديد من تلك الشركات متراخية للغاية، وتعرّض العاملين أحيانًا إلى مستويات إشعاع أعلى بكثير من المسموح به آنذاك أو حتى الآن."
        return txt
    }()

    
    init(text: String) {
        super.init(nibName: nil, bundle: nil)
        infoTextView.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()

        
    }
    
    fileprivate func setupLayout() {
        view.addSubview(infoTextView)
        infoTextView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
    }

    
    
    
    
    
    
    
   
}