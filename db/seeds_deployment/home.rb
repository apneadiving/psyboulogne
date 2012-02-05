# -*- coding: utf-8 -*-

home_page = Page.new(:title => "Home",
            :deletable => false,
            :link_url => "/",
            :position => (0)
            )
home_page.save

body = %Q{
  <h1>Titre à mettre</h1>
  <p>Le soutien psychologique que je propose est destiné à un public, d'<span class="bold">adolescents</span>, d'<span class="bold">adultes</span> et de <span class="bold">personnes âgées</span> en séances individuelles ou de groupe.</p>
  <p>Lors des entretiens j'aide mes patients à découvrir leurs potentialités de changement et de progrès grâce à leurs propres ressources.Chacun est en mesure de <span class="bold">trouver ses solutions et de clarifier</span> ses réels objectifs. Je travaille autour de ces solutions souvent difficiles à trouver seul.</p>
  <p>Je vous propose un soutien psychologique afin de mieux vous connaitre et de vous aider à surmonter les difficultés quotidiennes.<br/>Consulter une psychopraticienne ne signifie pas forcément commencer une thérapie qui durera des années, il s'agit parfois de se faire accompagner pendant un laps de temps plus ou moins long, le temps de surmonter une épreuve difficile par exemple. Les entretiens peuvent donc aussi bien être ponctuels que réguliers. Je tacherai de m'<span class="bold">adapter à votre vie</span>, à vos besoins.Les séances durent en moyenne 30 à 45 minutes et coutent 40 euros.Je me déplace également aux domiciles de mes patients.</p>
  <p>Le coaching psychologique est une alternative à de nombreuses approches thérapeutiques. La formation de Psycho-Praticien est une approche résultant de la conjonction de plusieurs disciplines, qui permettent d'aborder l'être dans sa totalité et dans un climat indispensable de confiance.</p>
  <p>J'ai reçu une formation professionnelle initiale théorique et je suis en formation permanente.<br/>De plus, de part mon engagement professionnel, je m'engage à régénérer ma formation et mon propre développement personnel tout au long de l'exercice de ma profession, via la participation à des sessions de formation complémentaire, à des conférences, ou à des colloques organisés par la profession.</p>
}

side_body = %Q{
  <p class="marron">Voici une liste non exhaustive des symptômes de mes patients sur lesquels je travaille le plus souvent :</p>
  <ul>
    <li>angoisses</li>
    <li>etats dépressifs</li>
    <li>addictions</li>
    <li>désorganisation alimentaire</li>
    <li>phobies</li>
    <li>problèmes de couples</li>
    <li>divorce</li>
    <li>relations difficiles entre parents/beaux parents et enfants</li>
    <li>échecs à répétition</li>
    <li>difficultés avec son bébé</li>
    <li>troubles de l'humeur</li>
    <li>deuil</li>
  </ul>
  <p class="marron">Notez que le psycho-praticien est neutre et bienveillant, <span class="marron bold">SURTOUT, IL NE JUGE PAS, ET DIRIGE ENCORE MOINS.</span></p>
  <p>Une totale confidentialité vous est garantie tout au long du suivi thérapeutique.
    Je suis tenu par le secret professionnel et je ne communique aucune information à un tiers sur une personne sans son accord. 
    Cette règle de confidentialité est essentielle pour l'établissement d'une relation de confiance à laquelle je tiens énormément et sans laquelle il n'est possible d'avancer sereinement.
  </p>
}

formulaire = %Q{
  <h1>Où se trouve le cabinet ?</h1>
  <h2>Situé à Boulogne Billancourt, au sein du Cabinet médical La Villa</h2>
  <div class="adresse">
    <p class="marron">Cabinet Médical La Villa<br/>30 TER rue de l'ancienne mairie - 92100 Boulogne-Billancourt</p>
    <p>Renseignements et prise de rendez vous au <span class="bold">06 45 62 22 80</span><br/>ou par mail : <span class="bold">capucinechastel@psyboulognebillancourt.com</span></p>
  </div>
}

home_page.parts.create({
              :title => "Body",
              :body => body,
              :position => 0
            })
home_page.parts.create({
              :title => "Side Body",
              :body => side_body,
              :position => 1
            })
home_page.parts.create({
              :title => "Formulaire",
              :body => formulaire,
              :position => 2
            })

fichier = Resource.create(:file => File.open("#{Rails.root}/db/seeds_deployment/CVCapucineChastel.pdf"))

