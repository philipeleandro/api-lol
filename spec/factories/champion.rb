FactoryBot.define do
  factory :champion do
    id_riot { Faker::Games::HeroesOfTheStorm.unique.hero }                                                 
    key {"999"}                                                       
    name { Faker::Games::HeroesOfTheStorm.hero }                                                  
    title {"O brabo"}                                        
    image {{"full"=>"#{Faker::Games::HeroesOfTheStorm.hero}.png", "sprite"=>"#{Faker::Games::HeroesOfTheStorm.hero}0.png", "group"=>"champion", "x"=>0, "y"=>0, "w"=>48, "h"=>48}}
    skins {[{"id"=>"266999", "num"=>0, "name"=>"default", "chromas"=>false}]}
    lore {"Antes defensores honrados de Shurima contra o temido Vazio, Aatrox e seus irmãos acabaram se tornando uma ameaça ainda maior para Runeterra, e a única coisa capaz de derrotá-los foi um tipo de feitiçaria mortal e traiçoeira. Mas após séculos de encarceramento, Aatrox foi o primeiro a encontrar a liberdade novamente, e ele saiu corrompendo e transformando quem fosse tolo o suficiente de tentar tocar na arma mágica que continha sua essência. Agora, com um corpo roubado, ele vaga por Runeterra transfigurado, em uma versão bizarra da sua forma anterior, buscando uma vingança apocalíptica."}
    blurb {"Antes defensores honrados de Shurima contra o temido Vazio, Aatrox e seus irmãos acabaram se tornando uma ameaça ainda maior para Runeterra, e a única coisa capaz de derrotá-los foi um tipo de feitiçaria mortal e traiçoeira. Mas após séculos de..."}
    allytips {["Use Avanço Umbral quando conjurar A Espada Darkin para aumentar suas chances de acertar um inimigo.",
      "Habilidades de Controle de Grupo, como Correntes Infernais ou efeitos de imobilização vindos dos seus aliados, ajudarão a preparar tudo para A Espada Darkin.",
      "Conjure Aniquilador de Mundos quando tiver certeza que pode forçar uma luta."]}
    enemytips {["Os ataques de Aatrox são bem indicados, então use o tempo de seus movimentos para escapar das zonas de acerto dele.", "É mais fácil sair das Correntes Infernais de Aatrox se você correr para os lados ou na direção dele.", "Mantenha distância quando Aatrox usar sua ultimate para evitar que ele reviva."]}
    tags {["Fighter", "Tank"]}
    partype {"Poço de Sangue"}
    info {{"attack"=>8, "defense"=>4, "magic"=>3, "difficulty"=>4}}
    stats {
      {"hp"=>650,
      "hpperlevel"=>114,
      "mp"=>0,
      "mpperlevel"=>0,
      "movespeed"=>345,
      "armor"=>38,
      "armorperlevel"=>4.45,
      "spellblock"=>32,
      "spellblockperlevel"=>2.05,
      "attackrange"=>175,
      "hpregen"=>3,
      "hpregenperlevel"=>1,
      "mpregen"=>0,
      "mpregenperlevel"=>0,
      "crit"=>0,
      "critperlevel"=>0,
      "attackdamage"=>60,
      "attackdamageperlevel"=>5,
      "attackspeedperlevel"=>2.5,
      "attackspeed"=>0.651}
    }
    spells {
         [{"id"=>"AatroxQ",
        "name"=>"A Espada Darkin",
        "description"=>"Aatrox bate sua espada no chão, causando Dano Físico. Ele pode bater até três vezes, cada vez em uma área de ação diferente.",
        "tooltip"=>
        "Aatrox bate com sua espada no chão, causando <physicalDamage>{{ qdamage }} de Dano Físico</physicalDamage>. Inimigos atingidos na área exterior são <status>Arremessados ao ar</status> brevemente e sofrem <physicalDamage>{{ qedgedamage }} de Dano Físico</physicalDamage>. A Habilidade pode ser <recast>Reconjurada</recast> duas vezes, alterando o formato do golpe e causando 25% de dano a mais do que o golpe anterior.{{ spellmodifierdescriptionappend }}",
        "leveltip"=>{"label"=>["Tempo de Recarga", "Dano", "Multiplicador de DdA total"], "effect"=>["{{ cooldown }} -> {{ cooldownNL }}", "{{ qbasedamage }} -> {{ qbasedamageNL }}", "{{ qtotaladratio*100.000000 }}% -> {{ qtotaladrationl*100.000000 }}%"]},
        "maxrank"=>5,
        "cooldown"=>[14, 12, 10, 8, 6],
        "cooldownBurn"=>"14/12/10/8/6",
        "cost"=>[0, 0, 0, 0, 0],
        "costBurn"=>"0",
        "datavalues"=>{},
        "effect"=>[nil, [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]],
        "effectBurn"=>[nil, "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"],
        "vars"=>[],
        "costType"=>"Sem custo",
        "maxammo"=>"-1",
        "range"=>[25000, 25000, 25000, 25000, 25000],
        "rangeBurn"=>"25000",
        "image"=>{"full"=>"AatroxQ.png", "sprite"=>"spell0.png", "group"=>"spell", "x"=>288, "y"=>48, "w"=>48, "h"=>48},
        "resource"=>"Sem custo"},
      {"id"=>"AatroxW",
        "name"=>"Correntes Infernais",
        "description"=>"Aatrox bate no chão, causando dano ao primeiro inimigo atingido. Campeões e Monstros Grandes precisam sair da área de impacto rapidamente ou serão arrastados para o centro e receberão dano novamente.",
        "tooltip"=>
        "Aatrox arremessa uma corrente, causando ao primeiro inimigo atingido {{ wslowpercentage*-100 }}% de <status>Lentidão</status> por {{ wslowduration }}s e <physicalDamage>{{ wdamage }} de Dano Físico</physicalDamage>. Campeões e monstros grandes da selva devem sair da área de impacto em até {{ wslowduration }}s ou serão <status>Puxados</status> de volta ao centro, sofrendo o mesmo dano novamente.{{ spellmodifierdescriptionappend }}",
        "leveltip"=>{"label"=>["Tempo de Recarga", "Dano"], "effect"=>["{{ cooldown }} -> {{ cooldownNL }}", "{{ wbasedamage }} -> {{ wbasedamageNL }}"]},
        "maxrank"=>5,
        "cooldown"=>[20, 18.5, 17, 15.5, 14],
        "cooldownBurn"=>"20/18.5/17/15.5/14",
        "cost"=>[0, 0, 0, 0, 0],
        "costBurn"=>"0",
        "datavalues"=>{},
        "effect"=>[nil, [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]],
        "effectBurn"=>[nil, "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"],
        "vars"=>[],
        "costType"=>"Sem custo",
        "maxammo"=>"-1",
        "range"=>[825, 825, 825, 825, 825],
        "rangeBurn"=>"825",
        "image"=>{"full"=>"AatroxW.png", "sprite"=>"spell0.png", "group"=>"spell", "x"=>336, "y"=>48, "w"=>48, "h"=>48},
        "resource"=>"Sem custo"},
      {"id"=>"AatroxE",
        "name"=>"Avanço Umbral",
        "description"=>"Passivamente, Aatrox se cura quando causa dano a Campeões inimigos. Quando ativado, ele avança em uma direção.",
        "tooltip"=>
        "<spellPassive>Passivo:</spellPassive> Aatrox recebe <lifeSteal>{{ espellvamp }}% de Vampirismo Universal</lifeSteal> contra Campeões, aumentando para <lifeSteal>{{ espellvampempowered }}% de Vampirismo Universal</lifeSteal> durante <keywordMajor>Aniquilador de Mundos</keywordMajor>.<br /><br /><spellActive>Ativo:</spellActive> Aatrox avança. Ele pode usar essa Habilidade durante as animações das outras Habilidades.{{ spellmodifierdescriptionappend }}",
        "leveltip"=>{"label"=>["Tempo de Recarga", "Porcentagem de cura", "Porcentagem de cura durante Aniquilador de Mundos"], "effect"=>["{{ cooldown }} -> {{ cooldownNL }}", "{{ espellvamp }}% -> {{ espellvampNL }}%", "{{ espellvampempowered }}% -> {{ espellvampempoweredNL }}%"]},
        "maxrank"=>5,
        "cooldown"=>[9, 8, 7, 6, 5],
        "cooldownBurn"=>"9/8/7/6/5",
        "cost"=>[0, 0, 0, 0, 0],
        "costBurn"=>"0",
        "datavalues"=>{},
        "effect"=>[nil, [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]],
        "effectBurn"=>[nil, "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"],
        "vars"=>[],
        "costType"=>"Sem custo",
        "maxammo"=>"1",
        "range"=>[25000, 25000, 25000, 25000, 25000],
        "rangeBurn"=>"25000",
        "image"=>{"full"=>"AatroxE.png", "sprite"=>"spell0.png", "group"=>"spell", "x"=>384, "y"=>48, "w"=>48, "h"=>48},
        "resource"=>"Sem custo"},
      {"id"=>"AatroxR",
        "name"=>"Aniquilador de Mundos",
        "description"=>"Aatrox libera sua forma demoníaca, aterrorizando tropas inimigas próximas, ganhando Dano de Ataque, cura aumentada e Velocidade de Movimento. Se ele conseguir um abate, este efeito é estendido.",
        "tooltip"=>
        "Aatrox revela sua verdadeira forma demoníaca, causando <status>Temor</status> às tropas próximas por {{ rminionfearduration }}s e recebendo <speed>{{ rmovementspeedbonus*100 }}% de Velocidade de Movimento</speed> que decai ao longo de {{ rduration }}s. Ele também recebe <scaleAD>{{ rtotaladamp*100 }}% de Dano de Ataque</scaleAD> e aumenta a <healing>própria cura em {{ rhealingamp*100 }}%</healing> ao longo da duração.<br /><br />Eliminar Campeões aumenta a duração desse efeito em {{ rextension }}s e redefine o aumento de <speed>Velocidade de Movimento</speed>.{{ spellmodifierdescriptionappend }}",
        "leveltip"=>
        {"label"=>["Dano de Ataque total aumentado", "Aumento de cura", "Velocidade de Movimento", "Tempo de Recarga"],
          "effect"=>["{{ rtotaladamp*100.000000 }}% -> {{ rtotaladampnl*100.000000 }}%", "{{ rhealingamp*100.000000 }}% -> {{ rhealingampnl*100.000000 }}%", "{{ rmovementspeedbonus*100.000000 }}% -> {{ rmovementspeedbonusnl*100.000000 }}%", "{{ cooldown }} -> {{ cooldownNL }}"]},
        "maxrank"=>3,
        "cooldown"=>[120, 100, 80],
        "cooldownBurn"=>"120/100/80",
        "cost"=>[0, 0, 0],
        "costBurn"=>"0",
        "datavalues"=>{},
        "effect"=>[nil, [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]],
        "effectBurn"=>[nil, "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"],
        "vars"=>[],
        "costType"=>"Sem custo",
        "maxammo"=>"-1",
        "range"=>[25000, 25000, 25000],
        "rangeBurn"=>"25000",
        "image"=>{"full"=>"AatroxR.png", "sprite"=>"spell0.png", "group"=>"spell", "x"=>432, "y"=>48, "w"=>48, "h"=>48},
        "resource"=>"Sem custo"}]
      }
    passive {{"name"=>"Postura do Arauto da Morte",
      "description"=>"Periodicamente, o próximo ataque básico de Aatrox causa <physicalDamage>Dano Físico</physicalDamage> adicional e o cura com base na Vida máxima do alvo. ",
      "image"=>{"full"=>"Aatrox_Passive.png", "sprite"=>"passive0.png", "group"=>"passive", "x"=>0, "y"=>0, "w"=>48, "h"=>48}}}
    recommended {[]}
  end
end