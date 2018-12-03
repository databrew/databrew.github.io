library(stringr)
library(tidyverse)
library(languageR) #https://www.rdocumentation.org/packages/languageR/versions/1.4.1/topics/compare.richness.fnc
library(quanteda) # https://www.rdocumentation.org/packages/quanteda/versions/0.9.8.5/topics/lexdiv

# https://www.parlament.cat/web/documentacio/publicacions/diari-ple/index.html
# https://www.parlament.cat/web/documentacio/transcripcions/transcripcions-ple/index.html
# https://www.parlament.cat/document/dspcp/282513.pdf

# Presidential addresses
# https://www.presidency.ucsb.edu/documents/app-categories/spoken-addresses-and-remarks/oral-address
# debates: https://www.presidency.ucsb.edu/documents/app-categories/elections-and-transitions/debates
# sessio 19.1 ordinaria 7 nov 2018
torra <- 
  c("President, diputades i diputats, molt bon dia a tots. Abans de res vull començar 
amb aquesta informació sobre l’alerta de seguretat a l’estació de Sants. Vull que sàpiguen, vostès i tots els ciutadans de Catalunya, que s’hi està treballant. I en aquest sentit excuso la presència del conseller Buch, que està al capdavant del nostre operatiu.
President Torrent, conselleres i consellers, diputades i diputats, benvolguts con ciutadans, quan el nostre país, des del primer d’octubre de l’any passat, està vivint 
l’experiència de l’intolerable, correm fins i tot el risc de normalitzar l’inacceptable, 
com si, encadenats a la repressió, semblés part del nostre paisatge quotidià la injustícia d’uns fets que repugnen la consciència de qualsevol home o dona lliures.
Aquest Ple d’avui no podia celebrar-se sense reconèixer l’hora greu que viu la nació, sense enfrontar-nos a la desraó d’una justícia dictada per botxins, sense denunciar l’atemptat als drets humans i civils que suposen els escrits d’acusació de la fiscalia i de l’advocacia de l’Estat en la causa que s’instrueix contra els que van donar la 
veu al poble de Catalunya en el referèndum d’autodeterminació. Quatre d’ells, diputats d’aquesta cambra; una altra, Carme Forcadell, expresidenta d’aquest Parlament, 
i  molts  d’ells,  exdiputats  o  exdiputades.  Per  la  seva  honorabilitat  i  per  la  dignitat  
d’aquest Parlament, aquest Ple no podia començar com si res no hagués succeït des 
de divendres. Perquè divendres passat es va culminar una passa més d’aquesta gran 
farsa que és el judici contra persones honorables i demòcrates, per haver donat veu a 
la ciutadania el primer d’octubre i per exercir el dret a l’autodeterminació en referèndum. Dos-cents catorze anys de presó per a divuit ciutadans o, el  que és el mateix, 
divuit mares i pares de família, per a molts, companys d’escó d’aquesta cambra.
    Però no vinc avui aquí a defensar ningú ni cap causa. Els nostres companys són 
    innocents, i la nostra causa és justa. Jo soc avui aquí per acusar l’Estat espanyol. 
    Aquest atac greu no pot passar de llarg sense que els grups d’aquesta cambra, dipositària de la sobirania de Catalunya, no es pronunciïn. Qui pot callar davant d’una 
    aberració tan gran? La involució, el retrocés democràtic que viu l’Estat espanyol ha 
    de preocupar qualsevol demòcrata. Tot això ja té molt poc a veure amb ideologies 
    o projectes polítics concrets. Qui és atacada en aquest moment és la democràcia en 
    majúscules. Tots vostès saben perfectament com s’ha construït una causa sobre delictes que no s’han comès, i vostès saben perfectament que precisament es va despenalitzar la convocatòria de referèndums ja fa uns anys. De debò que alguns de vostès, companys dels nostres presos polítics i exiliats, pensen continuar mirant cap a 
    una altra banda davant d’aquesta injustícia comesa contra ells? Perquè vostès hi han 
    parlat, hi han tractat, hi han fet bromes. Saben qui són, saben qui són les seves famílies, els coneixen. Hi han encaixat, s’hi han abraçat. De veritat que accepten que es 
    cometi aquesta injustícia amb elles i ells? Alguns de vostès, en privat, admeten que 
    se senten incòmodes; és més, que rebutgen aquesta actuació contra els seus companys. Restaran també avui impassibles? No alçaran la veu ja d’una vegada?
    Mirin, això s’ha de resoldre. Em nego a la resignació, ens neguem a la resignació, 
    perquè sempre ens negarem a resignar-nos davant de la injustícia. I els demanem 
    que s’afegeixin a la denúncia d’aquesta situació, que, més enllà dels casos concrets, 
    ens ha de preocupar a tots els demòcrates. Lluitar contra la injustícia o pels drets 
    quan els afectats són els propis és molt normal, és el que fem nosaltres. Però la defensa dels drets, de la llibertat i de la justícia pren valor real quan és a favor dels adversaris.
    Avui, ara, a partir d’ara, és el seu torn. Els demanem que es pronunciïn, que deixin els equilibris, els eufemismes, les mitges paraules, per a una altra ocasió. Són els 
    seus companys, amics en alguns casos, tancats entre barrots d’una presó, els que han 
    d’interpel·lar. És la seva veu, que els demana a vostès si els volen fer costat o si ja estan conformes amb la injustícia que els ha caigut al damunt.
    La fiscalia i l’advocacia de l’Estat s’han pronunciat amb molta claredat, busquen 
    venjança; la venjança governa els seus escrits d’acusació. I és evident, si no ho era prou fins ara, que, més enllà de quatre paraules en veu baixa, el Govern espanyol ha 
decidit que no es posarà al costat de la democràcia i la justícia, sinó que avala l’ús de 
    la via judicial per escarmentar políticament i per venjar la derrota a les urnes.
    És per això que retirem qualsevol mena de suport al Govern espanyol. No aprovarem els pressupostos del president Pedro Sánchez. Ja ho vaig anunciar al debat 
    de política general, i hem arribat al mes de novembre i el president espanyol no ha 
    posat damunt de la taula cap solució democràtica al conflicte polític, ni ha pres cap 
    decisió contra la repressió política contra l’independentisme. Quina ha estat la manera diferent de fer política del PSOE? Quin ha estat el diàleg? Quines han estat les 
    solucions polítiques a un conflicte polític? Quins, la valentia i el coratge per canviar 
    la situació? Com poden imaginar-se que aprovarem cap pressupost mentre duri la 
    repressió i l’absència de voluntat de resoldre el conflicte polític per vies democràtiques? Els dos grups independentistes catalans al Congrés espanyol ni entraran tan 
    sols a negociar el pressupost del Govern, mentre continuï la vulneració de drets civils i polítics i no hi hagi una voluntat clara de resoldre el conflicte polític per vies 
    polítiques. Que sàpiga tothom que nosaltres no trafiquem amb la democràcia ni amb 
    la dignitat; no ho hem fet nosaltres i no ho farà el poble de Catalunya.
    I han de saber que, en el judici contra els demòcrates catalans, en realitat jutjarem  l’Estat  espanyol,  l’acusarem  per  la  seva  actuació  autoritària,  que  va  contra  
    tots els valors europeus, republicans i humanístics. Ho faran els nostres presos polítics, ho farem nosaltres i ho farà la comunitat internacional, que observarà la manca 
    d’imparcialitat dels tribunals espanyols quan es tracta de reprimir independentistes. 
    No cal anar gens lluny: una sentència acabada de sortir del Tribunal Europeu dels 
    Drets Humans condemna l’Estat espanyol per manca d’imparcialitat en el judici a 
    Arnaldo Otegui i cinc dirigents 
    abertzales
    més. I Estrasburg és ben clar quan diu 
    que aquestes persones han complert sis anys de presó a conseqüència d’un judici que 
    no va ser just. Tinguin clar que la injustícia espanyola d’avui serà la condemna de la 
    justícia europea de demà.
    Se n’adonen? S’adonen realment de la gran dimensió internacional de la crisi i 
    del desprestigi del poder judicial espanyol en aquests moments? Els fiscals, els advocats de l’Estat, els magistrats del Tribunal Suprem, són a temps de rectificar. Han 
    de fer-ho. Ara ja sabem que, quan convé, els bancs, per estalviar-se de pagar l’impost de les hipoteques, prou que saben fer-ho. L’escàndol és absolut; el descrèdit del 
    poder judicial espanyol, complet. Al revés del tribunal de Gant pel cas Valtònyc i del 
    Tribunal Europeu dels Drets Humans pel cas Otegui, s’hi afegeix ara el canvi d’opinió del Suprem sobre hipoteques, cinc dies després d’haver dit el contrari. Tribunal 
    Suprem o suprema injustícia? És en aquest sentit que exigim la dimissió de Carlos 
    Lesmes, el president del Tribunal Suprem i del Consell General del Poder Judicial.
    Com els he dit, ho repeteixo, retirem qualsevol suport a Pedro Sánchez, i en el 
    debat monogràfic sobre Catalunya que es farà al Congrés deixarem clar que hi ha 
    tres  grans  consensos  a  la  societat  catalana;  veurem  quina  és  la  resposta  dels  que  
    diuen que volen trobar solucions polítiques a problemes polítics. Doncs els portarem 
    els tres consensos: la voluntat republicana per deixar enrere la monarquia, el rebuig 
    absolut a la repressió política amb que l’Estat espanyol mira de superar les derrotes 
    democràtiques i la voluntat d’exercir el dret a l’autodeterminació, que ha de ser respectat.
    I també els anuncio ara que, d’acord amb el conseller Maragall, ens adreçarem 
    personalment a tots els representants dels països de la Unió Europea per explicar 
    quina és la situació que vivim a Catalunya. Volem explicar directament com tracta 
    l’Estat espanyol els polítics que han volgut donar la paraula al seu poble.
    És l’hora de començar a preparar el camí de la mediació, d’obrir camins de resolució amb l’ajut de tercers actors que siguin reconeguts per les parts en conflicte. La 
    nostra proposta és i serà sempre la democràcia i el diàleg; que el futur es decideixi 
    amb els vots, que sigui la gent qui parli i que lleis que fa quaranta anys que duren no poden empresonar ni un poble ni els seus dirigents. També en aquest sentit intensificarem les pròximes setmanes la nostra acció exterior, a Europa i els Estats Units, 
per denunciar aquesta vulneració dels drets civils i la criminalització del dret a l’autodeterminació.
Voldria, avui també, retre homenatge a l’esperit i els valors de les persones honorables que viuen empresonades; alguns, ja fa més d’un any, anem cap al segon Nadal 
de presó. Ja els han robat un any de llibertat. Se n’adonen, com n’és, de gros, això? 
Se n’adonen, com no podíem començar aquest Ple d’una altra manera? És inacceptable, és impropi, és immoral. Divendres el Govern espanyol va perdre una oportunitat d’or per treure dels tribunals el conflicte que es viu a Catalunya i tornar-lo a 
la política, que és on ha de ser, que és on vam decidir que havia de ser. Compartim 
amb tots els catalans i les catalanes la immensa indignació en veure la petició de 
penes interminables a gent bona, a gent de pau. Però treballem i treballarem sense 
descans per convertir tota aquesta indignació en energia positiva, per encarar junts, 
units, aquests moments greus, amb la determinació del primer d’octubre i la força 
del 3 d’octubre. Ens necessitem a tots.
Votar no és cap delicte, organitzar un referèndum no és cap delicte. No acceptarem cap sentència que no sigui la seva absolució o l’arxivament de la causa; no 
acceptarem cap solució que no comporti el retorn dels exiliats a casa; no acceptarem cap proposta que no reconegui el dret a l’autodeterminació, i ho complirem. Ho 
complirem fins a les darreres conseqüències.
Ara ens toca defensar la democràcia i la llibertat. I ens agradaria tenir tots els diputats i diputades d’aquest Parlament, seu de la sobirania del poble de Catalunya, al 
nostre costat en aquest objectiu. Acabo. No podem fer veure que vivim en una situació normal, no. L’Estat espanyol demana 214 anys de presó contra els nostres, contra els vostres companys i companyes, contra un govern que va ser escollit pel poble. Exigim l’arxivament de la causa i la llibertat de tots els represaliats. No ens rendirem mai. Moltes gràcies.")

arrimadas <- c("Gracias, señor presidente. Señor presidente de la Generalitat, esperábamos alguna novedad: comparecencia urgente, cinco minutos antes de cerrar el registro. Si ha 
dicho lo de siempre: 
presos
 y que no van a apoyar los presupuestos del Estado. Yo 
esperaba algo más, alguna novedad, no sé... Hay una información de que van a convocar huelga de médicos para final de mes. No sé, a lo mejor usted tendría algo que 
decir; no, pero de eso, no.
               Ustedes han dicho que van a devolver la paga extra a los funcionarios en el 2027, 
               pero de eso no tiene nada que decir el señor Torra, hombre, por favor.
               Sale usted aquí a defender a Otegi. Usted es el defensor de Otegi. Usted ha renunciado a defender a más de media Cataluña porque nos ha cambiado por Otegi, 
               por Otegi nos ha cambiado el presidente de la Generalitat.
               Ni una mención –ni una mención– a los 850 muertos de ETA, ni una. Ni una 
               mención a los 2.000 heridos de ETA, ni una; ni una mención a los 300 casos sin resolver de ETA, ni una. Aquí sale a defender a Otegi. ¿Para eso abre usted el Parlament? ¿Lo tiene tres meses cerrado y hace una comparecencia urgente para hablar de Otegi y del 
               procés
               ?
               Creo que hoy..., y ha metido lo de las hipotecas pero que no engaña a nadie: usted 
               hizo la petición de comparecencia antes de que saliera la sentencia de las hipotecas, 
               o sea que no está aquí para hablar de hipotecas. Está para hablar de Otegi y para 
               hablar de lo de siempre, del 
               procés
               , y ese anuncio de que no van a apoyar los presupuestos. Ya lo sabemos, ya lo habían dicho. Ya sabemos que con ustedes..., ustedes 
               pueden decir una cosa muchas veces y luego cambiar, pero, vaya, en principio... Yo, 
               en esto, fíjese usted, les había creído, no sé si me equivoco.
               Ustedes critican mucho la justicia española porque ustedes no la pueden controlar. La Ley de transitoriedad jurídica, ese bodrio desde el punto de vista democrático y jurídico que ustedes aprobaron aquí, ¿sabe lo que decía? Sé que usted lo sabe, 
               ¿eh? Decía que el presidente de la Generalitat iba a elegir a dedo a los miembros del 
               Tribunal Supremo. ¿Usted va a dar lecciones de independencia judicial cuando ustedes lo que querrían es elegir a dedo a los miembros del Tribunal Supremo de esa 
               hipotética república catalana?
               Además, no tenían ni que ser jueces, ¿eh?, que podían ser licenciados en derecho, 
               amiguetes del presidente. Ya tenemos un tribunal supremo.
               Decían más, ¿eh?, decían: «Los decretos ley, los decretos leyes del Gobierno no 
               iban a ser sometidos a ningún tipo de control judicial ni parlamentario ni político ni 
               nada. Olé, ya no solo es que no hay independencia judicial, sino que quitan directamente la capacidad de la justicia.
               Decían otra cosa en la Ley de transitoriedad jurídica, estos señores, decretaban 
               la impunidad absoluta para ellos y para sus compañeros. Olé, ¿eh?, y salen aquí a dar 
               lecciones, ¿de qué?, ¿de independencia judicial?, ¿de que no les gusta la justicia española? Menos mal –menos mal– que no se ha puesto en marcha su justicia, menos 
               mal que estamos en el siglo 
               XXI
               en la Unión Europea y que no les dejan a ustedes 
               hacer las barbaridades.
               Sale aquí a quejarse de que el Gobierno no ha podido presionar lo suficiente a la 
               fiscalía para cambiar la acusación. Se quejan de eso, porque eso es lo que ustedes 
               harían. Si es que en el fondo se han quitado la careta, les tenemos que agradecer la 
               enorme sinceridad.
               Ustedes querrían llamar al fiscal y a los jueces y decirles: «A estos señores..., 
               son amigos míos, ¿eh?, a estos ni tocarlos, que son políticos.» Y, como son políticos, 
               pues tienen impunidad. Eso es lo que a ustedes les gustaría. Pero por suerte estamos 
               en un país de la Unión Europea. 
               Ustedes han votado aquí quién tenía que entrar o salir de la cárcel. Pero, ¿quiénes se creen ustedes para decidir quiénes tienen que entrar en la cárcel o quiénes 
               tienen que salir? Y ustedes dicen: «No, es que Europa nos dará la razón.» De momento, no mucho.
               Usted viene aquí a indignarse, como defensor de Otegi, por una sentencia contraria a una sentencia española del Tribunal Europeo de Derechos Humanos. Según su 
               criterio, esa sentencia ya significa que es que España ya no tiene un sistema judicial 
               moderno y aquí no hay democracia. Pues le voy a dar una mala noticia, señor Torra: España tuvo, en el año 2017, seis 
sentencias contrarias del Tribunal Europeo de Derechos Humanos –seis–, ojalá no 
               hubiera sido ninguna, pero tuvo seis. ¿Sabe su país de referencia ahora mismo en 
               términos judiciales, que es Bélgica, cuántas tuvo? Trece, con 11 millones de personas, y nosotros 47 millones de habitantes. O Alemania, ese país donde..., ahora le 
               leeré un trozo de la sentencia, que creo que usted no se ha mirado, pero Alemania 
               tuvo dieciséis sentencias contrarias. Según su criterio, si España no es una democracia porque ha habido esta sentencia que usted, como defensor de Otegi –que parece 
               el abogado de Otegi–, sale aquí a defender, pues entonces Bélgica no sé ya lo que le 
               parecerá, ¿no?, que tiene más del doble con solo 11 millones de habitantes.
               Pero es que le voy a decir más, porque usted hay una cosa que no se ha leído. Es 
               importante leer –es importante leer, sí, sí, sí–; le voy a leer una cosa que ustedes no 
               han leído seguramente, y que, ¡ojo!, quien solo se informe por TV3, que va a escuchar una cosa que le va a provocar un cortocircuito mental, ¿eh? 
               (Aplaudiments.)
               ¡Atención, atención! Sentencia que deniega la extradición del señor Puigdemont por 
               el delito de rebelión pero que aprueba la extradición por delitos gravísimos, como 
               malversación, ¿no? Atención: «No se puede denegar la entrega» –de Puigdemont– 
               «por el hecho de que el reclamado se considere objeto de una persecución política.» 
               Punto. Atención, ¿eh?: no existe tal persecución, señores que se informan únicamente por TV3. Sentencia que deniega la extradición por rebelión y que aprueba la extradición por malversación. No existe tal persecución.
               Leo otro párrafo: «No puede afirmarse que el acusado» –Puigdemont– «en caso 
               de ser extraditado se vería sometido a persecución política.» Es decir que el Reino de España le quisiera condenar únicamente por sus ideas políticas. Es importante 
               leer, señor Torra, comprensión lectora, leer. No existe tal persecución.
               Supongo que alguno está diciendo: «No puede ser, si esto yo no lo he visto en 
               TV3, si esto en Catalunya Ràdio no lo han dicho, ¿cómo puede ser?» Sí, ustedes viven en una realidad paralela, en la que Europa condena a España. No, el Consejo de 
               Estado salió el otro día a avalar el sistema judicial español, y, concretamente, el caso de los presos del 
               procés.
               ¿Sabe una cosa que sí que se ha condenado en el Parlamento Europeo que no ha 
               sido el sistema judicial español? Los artículos xenófobos y racistas del señor Torra, 
               eso sí que se ha condenado por los grupos parlamentarios europeos. Claro, ustedes 
               dirán: «Hay que ver, ¿cómo puede ser que no nos den la razón en Europa si las evidencias están claras?» Ustedes lo tendrán que tener tan claro todo, viendo todo el día 
               TV3 dirán: «Qué raro que Europa condene los artículos del señor Torra, que no tienen nada de malo, según ustedes, y no condenen a la justicia española.» Se van a llevar una frustración colectiva, ustedes, que, de verdad, me da incluso lástima porque 
               ustedes viven en una realidad paralela.
               El sistema judicial español puede tener muchas –muchas– cosas a mejorar, muchas. De hecho, nosotros proponemos algunas; algunas que ustedes Convergència 
               i Unió no ha propuesto en la vida, ni Esquerra Republicana en el Congreso de los 
               Diputados: garantizar más independencia a la fiscalía; no elegir a dedo a los miembros del Tribunal Constitucional, cosa que Convergència i Unió se ha llevado toda la 
               vida enchufando ahí a su gente... De eso no se han quejado nunca, ¿por qué? Porque 
               mientras ustedes la controlaban, les gustaba. Pero ahora que ya no la controlan quieren crearse una propia para controlarla ustedes que es su objetivo. Por eso no puede 
               dar aquí ninguna lección de independencia judicial, señor Torra.
               Otro revés en Europa, porque ellos dirán: «¿Cómo puede ser –cómo puede ser– 
               que en Europa no nos den la razón?» Es que en Europa le han echado de ALDE a su 
               partido. El señor Tremosa, ¿eh? ¿Se acuerdan ustedes cuando entramos en ALDE? 
               «No vamos a permitir que Ciudadanos entre en la familia de los demócratas europeos, lo vamos a impedir.» Pues al final a quien le han echado, 
               out
               , 
               door
               , es a Tremosa y a los suyos, de ALDE. Fuera, fuera, fuera... 
               (Aplaudiments.) Por eso le digo, en serio, que, desde el punto de vista humano, casi que me da un 
poco de..., bueno, de lástima porque ustedes dirán: ¿Cómo puede ser esto? Porque 
se creen sus propias mentiras. Salgan de la mentira del 
procés
, salgan de la mentira 
de TV3. Es legítimo criticar una decisión judicial. Es legítimo que las familias que 
están en prisión quieran estar con sus familias, es legítimo, es entendible, pero lo 
que no es legítimo es que ustedes quieran crear una justicia para controlarla ustedes. 
Y que se quejen de la que hay ahora no la controlan. Eso no es legítimo.
Y, sobre todo, señor Torra, usted ha hecho aquí otra vez, no es novedoso, ¿eh?, 
pero ha hecho aquí una amenaza que yo simplemente le pido que concrete. ¿Qué significa que no van a aceptar las sentencias? ¿Qué significa? ¿Van a atacar a los jueces? 
¿Van a asaltar a los tribunales? ¿Van a dejar que asalten el Parlamento? ¿Nos van 
a perseguir a nosotros? ¿Van a ocupar el aeropuerto? ¿Qué van a hacer? ¿O es una 
gran manifestación? Porque, sabe lo que le va a pasar a usted, que los suyos, a los 
que usted está calentando en la calle, a los CDRs y a los comandos, y a todo esto..., 
cuando usted quiera decir que van a hacer una manifestación le van a decir: «¿Una 
manifestación de qué, vamos a hacer algo más contundente?» 
Y a usted le van a pasar los comandos por encima. Las masas calentadas por usted aquí. «No lo vamos a permitir –no lo vamos a permitir.» ¿Cómo? ¿Qué van a hacer ustedes? ¿Qué van a hacer? Porque un demócrata normal recurriría, se iría a instancias superiores..., pero, claro, viniendo de usted, es que no sé qué esperarme. Sea 
valiente y responda. Aunque me parece, ¡ojo!, que creo que ni va a salir el presidente 
a responder. ¿No va a salir ni a hacer la réplica, señor Torra? Luego habla usted de 
diálogo, ¿qué diálogo? Diálogo con los presidentes de grupo.
Responda a esta pregunta, porque de lo que pase en Cataluña usted será el último 
y el único responsable. Muchas gracias.")

iceta <- c("Moltes gràcies, senyor president. Molt honorable president de la Generalitat, si 
no l’he entès malament vostè ha sortit, ha demanat aquesta compareixença extraordinària, per dir-nos que està indignat per les decisions de les parts qualificant inicialment, provisionalment, un judici i que no donarà suport a Pedro Sánchez. Bé, 
potser sí que calia dir-ho aquí, i, a més, a nosaltres, els debats parlamentaris ens 
agraden, han de servir perquè posem en comú. 
Ara, permeti’m, creiem que és absolutament ridícula la pretensió de pujar al faristol d’aquesta cambra parlant en nom d’un poble oprimit. Cal recordar que vostè 
parla a un parlament sorgit d’unes eleccions, emparat en unes lleis; un parlament 
elegit pel poble del qual vostè ha estat després confiada la tasca de president i que 
gestiona un pressupost de 38.000 milions d’euros amb més de 250.000 empleats públics i 16.610 mossos d’esquadra. Com a poble oprimit, realment, de bandera.
Segona cosa que li volíem dir: no abusi... –si és possible no ho faci–, però, igualment,  no  abusi  de  parlar  en  nom  del  poble,  a  menys  que  consideri  que  la  meitat  
d’electors d’aquest país no formen part d’aquest poble. Hem d’anar molt en compte 
amb aquestes coses. Una cosa és que nosaltres aspirem a parlar en nom de tothom, 
l’altra que ens ho creiem, i que pontifiquem des d’una pretesa responsabilitat total i 
absoluta d’un poble format per 7 milions i mig de persones.
Per què estem aquí? Perquè hi ha una Constitució, perquè hi ha un Estatut, una 
LOREG, perquè ens vam presentar a unes eleccions convocades per Mariano Rajoy 
i perquè uns les van guanyar i altres no les van guanyar. I per això els que tenen majoria parlamentària tenen la legitimitat de governar. Quin és l’origen del problema, almenys com nosaltres l’entenem? Hi ha hagut, i 
és evident, un fracàs de la política. Hi va haver-hi dos governs que no van ser capaços de dialogar. No m’entretindré a establir qui tenia més o menys responsabilitat en 
           això, és obvi que el Govern d’Espanya no s’hi va esmerçar gens. I, després –i aquí és 
           on segurament discrepem, president–, hi va haver-hi una decisió conscient de vulnerar la legalitat per part de l’anterior Govern de Catalunya. Hi ha massa fotos de consellers i presidents ensenyant requeriments del Tribunal Constitucional i dient que 
           se’ls volien saltar, com per ara dir que no sabem per què hem arribar fins on hem 
           arribat. 
           Els dies 6 i 7 de setembre es va vulnerar el Reglament del Parlament, els criteris 
           del lletrat, el criteri del Consell de Garanties Estatutàries de Catalunya, l’Estatut, la 
           Constitució i les resolucions del Tribunal Constitucional. Per tant, jo ja comprenc 
           que és legítim dir: «No, és que s’estan perseguint idees.» Home, es deuen estar perseguint de forma molt selectiva, perquè són idees que són defensades obertament 
           per moltíssima gent i per vostè mateix des de la tribuna del Parlament. Ens pot agradar més o menys, i podem assenyalar errors i defectes de la justícia espanyola, com 
           de  la  justícia  d’altres  països  sense  necessitat  de  faltar  a  la  veritat.  Des  del  nostre  
           punt de vista, és tan absurd dir que no es va cometre cap delicte, com si saltar-se la 
           Constitució no ho fos, o dir que això s’arreglarà amb llargues penes de presó. 
           Vostè diu que és l’hora de parlar. Miri, la veritat és que nosaltres no hem deixat 
           de parlar sobre aquesta qüestió. Fins i tot se’ns ha criticat a vegades, i potser amb 
           raó, que parlem massa. Però qui els parla ha dit des de sempre que no veu un delicte 
           de rebel·lió. Qui els parla ha dit des de sempre que vèiem desproporcionada la presó preventiva. Qui els parla, fins i tot, va cometre la gosadia d’evocar la possibilitat 
           d’un indult, quan ningú no ho havia fet, i avui, doncs, ja no ho hem de fer, perquè els 
           eventuals –que és veritat que abans d’un judici i abans d’una sentència és molt temerari parlar d’aquestes coses, però– diuen: «No el demanarem.» Per tant, nosaltres 
           hem dit el que calia, en el nostre punt de vista, que diguéssim.
           I, per tant, i per no avorrir-los, jo els diré el que diu una advocadessa d’un dels 
           encausats. Cito literalment: «Sorprèn a algú aquest escrit d’acusació? No crec que 
           pugui sorprendre massa gent. Ara haurem de fer els escrits de defensa, però, un cop 
           presentats tots els escrits de defensa, es partirà de zero en la pràctica del judici oral. 
           Podrem parlar de què és i què no és violència, podrem posar damunt la taula jurisprudència. Per tant, hem de confiar que surti un bon judici.» Acaba la cita. Judit 
           Gené. És lògic que això ho faci un advocat defensor, perquè és impossible que un 
           advocat defensor vagi a un judici dient que no hi ha res a fer i que les coses estan ja 
           decidides. 
           Certament, la justícia espanyola s’ha fet mereixedora d’algunes crítiques, que podem fins i tot compartir. Però hi ha una diferència, crec, bastant gran, entre el seu 
           plantejament, les seves crítiques, i les nostres. Nosaltres ho fem des de la defensa de 
           l’estat de dret, des de la defensa del poder judicial, des de la defensa del que estableix la Constitució. Ho fem dient que encara que no ens agradessin, acataríem les 
           sentències, perquè quan vostè diu «no les acceptarem», perdoni, què vol dir exactament? Perquè, imagini’s, a mi no m’ha agradat gens la decisió del Tribunal Suprem 
           d’ahir, gens. Ara, si jo hagués de fer una hipoteca, que no puc, perquè ja en tinc una, 
           però, en fi, si avui anés a un banc, no podria dir: «No fem cas de la sentència d’ahir.»
           Com a polític –cosa que ja vaig fer ahir– puc dir: «Jo el que faria, i el que proposaré, és modificar la llei», perquè aquesta és la funcionalitat de la divisió de poders. 
           Els polítics fem les lleis i els jutges les interpreten i les apliquen. Vol dir això que 
           sempre estem d’acord amb el que digui un jutge? No. I és veritat que en aquest judici 
           s’han produït moltes coses molt xocants, s’han produït aquestes ordres demanades 
           a tribunals europeus que no han estat concedides en els termes que s’havien demanat, i que no han estat recorregudes, i han estat retirades. També hi ha qui es pot 
           sorprendre –jo ho faig– que un mateix procés s’estigui desenvolupant en jutjats diferents. Hi ha moltes coses que són discutibles. Ara, en un estat de dret un pot criti
-
           car les decisions judicials, però, a diferència de les decisions del poder legislatiu, del 
           poder executiu, que poden ser recorregudes, doncs, les judicials tenen una efectivitat 
           immediata, particularment si són del Tribunal Suprem.
           Per dir la segona cosa que vostè ens deia, vostè diu: «No, com que no ens han 
           agradat els escrits de la fiscalia i l’Advocacia de l’Estat, no votarem els pressupostos.» Miri, el sentit del vot als pressupostos és absolutament lliure, i les raons que 
           poden avalar una o altra posició també ho són. Ara, permeti’m que li digui, jo crec 
           que és un error lligar el vot dels pressupostos a un judici que encara no s’ha celebrat. 
           Crec que és un error. Perquè, a més, es diu: «No, el Govern d’Espanya no ha dit, no 
           ha fet...» En fi, hi ha qui considera, sentit contrari, que el Govern d’Espanya ha dit 
           i ha fet massa, en els termes, per exemple, de la discussió sobre l’existència o no de 
           violència en aquests delictes i, per tant, la qualificació adequada o no, de rebel·lió del 
           delicte. I això, entre altres coses, li ha comportat –i és legítim en democràcia– ques al mateix president del Govern o a la vicepresidenta del Govern quan es va esplaiar sobre els riscos de la presó preventiva.
           Ara, vostès diuen: «Volem condicionar-ho a això.» Miri, vostès sabran què és el 
           que més beneficia els catalans, vostès ho sabran, perquè no estem parlant només de 
           beneficis concrets, tangibles, que estan en el projecte, sinó també quina orientació 
           política volem a la política espanyola, si un intent d’establir un diàleg... Vostè diu: 
           «Quin diàleg?» Escolti’m, no tinc temps de llegir la tirallonga de reunions que ha 
           provocat el restabliment de relacions institucionals entre el Govern de Catalunya i el 
           Govern d’Espanya. Jo no sé si avui m’ho dirà, no només perquè contesti o no, sinó si 
           m’ho dirà, però a mi em consta que hi havia en el Govern de Catalunya satisfacció 
           perquè es reprenguessin aquests contactes, la qual cosa no vol dir, necessàriament, 
           acord sobre les qüestions concretes que se suscitaven o com se resolien. Ara, aquí 
           hem vist, per exemple, retirar-se dos recursos d’inconstitucionalitat contra lleis catalanes. Això ha passat, per un acord entre els dos governs. Llàstima que no hagués 
           passat abans, que ens hauríem pogut estalviar els recursos corresponents si s’hagués 
           produït aquesta relació entre els dos governs amb el Govern anterior.
           Jo, president, entenc perfectament i, fixi’s, respecto, que vostè digui: «No podem 
           fer una sessió del Parlament com si res no hagués passat.» Jo puc entendre, president, i respecto, que vostè vulgui pujar en aquesta tribuna per donar-nos la seva opinió sobre el que està passant. El que sí que li demano, i ho feia a l’inici de la meva 
           intervenció: no s’arrogui la representativitat del conjunt del poble, perquè no la té, i 
           no oblidi mai que els socialistes estem fent –m’atreviria a dir– tant com vostès per 
           intentar que les coses acabin bé, començant per la gent que serà sotmesa a judici 
           properament.
           Moltes gràcies.")
albiach <- c("Sí; gràcies, president, i bon dia a totes i a tots. President, vostè ha parlat de la repressió que pateix Catalunya i també ha parlat dels pressupostos generals de l’Estat 
per tancar la porta a donar-los qualsevol suport. Jo ara li parlaré de repressió. I per 
parlar de pressupostos ja tenim la sessió de control, perquè per a nosaltres..., nosaltres no supeditem una cosa a l’altra, per a nosaltres són dos debats, de drets i llibertats, que no són incompatibles, són complementaris, són drets i llibertats que sumen, 
en cap cas resten.
El que estem patint els darrers dies a Catalunya només fa palès que vivim una 
situació d’excepcionalitat democràtica. Els escrits de la fiscalia i de l’Advocacia de l’Estat així ho demostren. Les acusacions en contra de Jordi Sànchez, de Jordi Cuixart, de Carme Forcadell, de Jordi Turull, de Joaquim Forn, de Josep Rull, de Doors Bassa, de Raül Romeva, d’Oriol Junqueras, així com per la resta de membres de 
              la Mesa, entre els quals també està el nostre company Nuet, no només són una barbaritat, són tota una anomalia democràtica. No es pot empresonar ni portar a ningú 
              davant dels tribunals per fer política. Ho hem dit i ho direm sempre: els problemes 
              polítics s’han de resoldre per la via política, i mai, mai, per la via judicial. Vivim 
              temps gravíssims, temps de vulneració de drets i de llibertats, temps de crisi de la 
              democràcia per la judicialització de la política, i també per la politització de la justícia. I ahir mateix ho vam tornar a veure, ho vam poder comprovar amb les sentències del Tribunal Europeu de Drets Humans, i també amb la sentència del Tribunal 
              Suprem sobre l’impost de les hipoteques, una sentència que és forta contra la ciutadania i feble amb els poderosos, i que demostra que, una vegada més, per les pressions, guanya la banca, i per això nosaltres també diem que ha de dimitir el president del Tribunal Suprem. 
              A Catalunya estem davant d’un judici en contra d’adversaris polítics. La porta veu de Jutges per la Democràcia ha dit que no hi ha rebel·lió. Amnistia Internacional 
              està demanant la llibertat dels Jordis. La justícia alemanya i belga fan caure la careta 
              de la via Llarena. Més de cent professors i professores de dret penal també han negat l’existència de rebel·lió, i malgrat tot, malgrat tot, la fiscalia seguix insistint. La 
              nostra posició és coneguda i ferma: no hi ha rebel·lió, no hi ha sedició i tampoc hi 
              ha malversació. Per tant, l’única sentència justa és la llibertat, i no la llibertat quan 
              s’acabi el judici, la llibertat des de ja mateix, una llibertat que mai s’hauria d’haver 
              trencat.
              Per això des de Catalunya necessitem una resposta que estiga a l’altura d’aquest 
              moment  històric,  necessitem  aplegar  grans  consensos,  grans  consensos  i  grans  
              acords de país, que tornen a reunir el 80 per cent que està a favor del dret a decidir 
              i en contra de l’acció repressiva de l’Estat. I per aplegar aquestos grans consensos, 
              cal parlar de quelcom que és imprescindible en la vida quotidiana i en la política, 
              en les relacions personals en general: l’empatia. L’empatia no és només ser capaç de 
              posar-se al lloc de l’altre, també és la capacitat de comprendre les seues emocions 
              i d’escoltar activament. Ha faltat empatia, en els últims temps, i segurament això, 
              aquesta siga una de les causes de la situació d’excepcionalitat democràtica que estem 
              patint. Malgrat totes les dificultats, el dolor, les ferides obertes i la situació d’aparent bloqueig, ens cal començar per aquest pas tan bàsic de recuperar l’empatia per a 
              avançar cap a una nova Catalunya.
              Recuperar l’empatia és una tasca de tots i de totes. I ahir, ahir, Òmnium Cultural 
              també ens va marcar el pas cap a aconseguir grans acords de país. Els partits polítics haurien de prendre nota de cara a la taula del diàleg, i començar a acordar objectius, un ordre del dia que siga transparent i clar, i convidar també la ciutadania 
              organitzada, perquè el 80 per cent no el representen només les forces polítiques, el 
              80 per cent també està representat per les forces socials que des de la transversalitat 
              defensen i construeixen democràcia cada dia. I per això nosaltres, des dels ajuntaments, també impulsarem mocions de suport a aquest 80 per cent.
              Avui vivim una situació excepcional a Catalunya i arreu del món també sorgeix 
              l’extrema dreta, una extrema dreta que té un discurs de l’odi i defensa l’excepcionalitat com a norma per a la societat. Ho hem vist recentment al Brasil, on Bolsonaro 
              defensa la violència contra l’oposició, però també a la Itàlia de Salvini, als Estats 
              Units amb Trump i també veiem com la dreta espanyola cada dia parla més de venjança i menys de justícia. A ulls de qualsevol demòcrata, el poder judicial no està 
              complint amb la seua tasca que d’ells s’esperaria en un estat de dret, i això ja està tenint greus conseqüències per a la convivència, perquè la judicialització del conflicte 
              català només allunya la seua solució democràtica. Per això li demanem a Pedro Sánchez que assumeixi d’una vegada per totes el 
lideratge que el seu paper li exigeix i faça tot el que està al seu abast per acabar amb 
aquesta injustícia, que només dificulta la solució política del conflicte. 
I a Catalunya, a Catalunya, com he dit, el que necessitem és diàleg i empatia. Entenc que la situació és summament complexa, i que els seus partits siguen reticents 
a  arribar  a  acords  en  la  situació  actual,  però  necessitem  avançar  en  aquest  acord  
polític, i m’estic referint als pressupostos generals de l’Estat. Ho hem de fer per la 
gent. Necessitem construir un futur amb llibertat i amb dret a decidir, i també un futur sense desigualtats i amb cohesió social, sense desigualtats i des de la fraternitat 
amb la gent de baix i amb la gent que pateix, president. Un futur que només podrem 
construir amb les grans majories del país, plantant cara a l’odi i a l’extrema dreta, 
junts i juntes davant de l’excepcionalitat i dient amb convicció que no passaran.
President, no hi ha possibilitat de superar el gir reaccionari a Espanya si no caminem junts i juntes en la conquesta dels drets civils, però també dels drets socials i 
dels drets democràtics. Perquè sempre és la mateixa batalla, és una batalla, la batalla 
per obrir un temps nou de justícia social i de reconeixement nacional.
Gràcies.")

sanchez_dipp <- c("Gràcies. Bé avui no podem començar... Bon dia. No podem començar d’una al
-
                  tra manera que no sigui mostrant la nostra solidaritat amb els veïns i les veïnes de 
                  Verges, que, una vegada més, han patit la impunitat de l’extrema dreta campant pels 
                  seus carrers i s’han despertat amb el municipi ple de pintades feixistes. Per tant, des 
                  d’aquí, tota la solidaritat i tot el suport als veïns i veïnes de Verges, i de forma molt 
                  clara dir-los que no passaran. (Aplaudiments.)
                  El divendres vam conèixer la barbàrie en forma d’escrits d’acusació. Fiscalia i 
                  Advocacia de l’Estat no es contradiuen, sinó que es complementen; volen cobrir totes les possibilitats ja pensades, ja pensant en el Tribunal Europeu dels Drets Humans.
                  Reflexionem sobre el que significa això. Fer política i donar veu al poble es respon amb anys de presó. No hi ha violència, cap tipus de violència, no hi ha tipus 
                  penal. Això ho diuen més de cent juristes de reconegut prestigi de l’Estat espanyol. 
                  En la seva lògica inquisitorial assistim a un nou episodi de l’única violència política 
                  deliberada, estructural i decidida en foscos despatxos que s’ha viscut en els darrers 
                  anys a Catalunya, on la seva majoria democràtica i social ha triat sempre, irrevocablement, les vies no violentes, i que l’únic delicte que ha comès és protegir els drets 
                  de tots i de totes. L’única violència és la violència institucional, la violència d’Estat; 
                  és venjança i és la naturalesa de l’aparell de l’Estat espanyol.
                  El molt honorable president de la Generalitat de Catalunya ens ha dit que ve a 
                  acusar. Ja ens sembla bé. Però no podem estar negociant un dia i acusant l’altre, perquè blanquegen i legitimen el subjecte que volen acusar.
                  Ahir també coneixíem la sentència del Tribunal d’Estrasburg contra l’Estat es panyol per no haver donat un judici just a Arnaldo Otegi. Que a l’Estat espanyol 
                  hi  ha  tribunals  que  no  són  imparcials  és  evident;  ho  sabem  nosaltres  i  ho  saben  
                  els tribunals de drets humans europeus. El sistema judicial de l’Estat espanyol està 
                  més qüestionat i desprestigiat que mai. La d’ahir, però, no és la primera sentència 
                  condemnatòria contra l’Estat. El 2004: Operación Garzón contra l’independentisme; 
                  primera condemna del Tribunal de Drets Humans per tortures contra l’Estat espanyol i contra el magistrat Garzón. 2011: la justícia europea dona la raó a Aritz Beristain, activista basca. Com molts altres, va patir abusos i maltractaments per part de la policia espanyola; són diverses les sentències que condemnen aquest Estat per 
maltractaments o tortures d’activistes bascos. 2012: Estrasburg dona la raó a Otamendi, que va ser director del diari 
                  Egunkaria
                  , i a altres companys periodistes per 
                  tortures que van rebre per part d’agents de la Guàrdia Civil. 2017: es confirma el que 
                  era evident, cremar fotos del rei és un exercici de llibertat d’expressió. Una rere l’altra, sentències en què l’Estat espanyol queda totalment desemmascarat. I no és que 
                  ho diguem des d’aquí, sinó que són aquests tribunals europeus que vostès també reconeixen.
                  Quan es tracta de jutjar els drets i les llibertats a Catalunya o a 
                  Euskal Herria
                  , 
                  la justícia espanyola, emparada per tot el seu aparell, no dubta. Però la injustícia no 
                  es queda aquí. La justícia espanyola no té res de cega ni d’imparcial, és de classe, 
                  nacionalista i patriarcal. Per si en quedava algun dubte, ahir el Tribunal Suprem ens 
                  ho deixava claríssim: la banca sempre guanya. No es tracta únicament d’un aparell 
                  judicial que persegueix a qui busca vies democràtiques per exercir el dret a l’autodeterminació, sinó a qui practica la dissidència, i persegueix també el conjunt de les 
                  classes populars i els seus drets. El que estem vivint aquestes darreres setmanes, i 
                  especialment ahir i avui respecte a la sentència sobre qui recau el pagament dels impostos ens demostra molt clarament com funciona l’Estat espanyol. Si la sentència 
                  no agrada a la banca, es reuneix el Ple de la Sala del Contenciós Administratiu del 
                  tribunal i la canvia.
                  A quin règim li pot sortir a compte carregar a les espatlles desenes de sentències 
                  d’agressions i tortures, vulneracions de drets fonamentals? A un règim que se senti impune, a un règim de naturalesa i herència autoritària, a un règim antidemocràtic, que, 
                  dia sí i dia també, queda retratat, un règim que és el que és: un estat antidemocràtic.
                  Van mentir construint relats falsos; continuen fent-ho i ho continuaran fent. Per 
                  tant, davant d’un Goliat dèspota, caldrà que trobin un David organitzat, desobedient 
                  contra la injustícia, com ja vam fer l’1 i el 3 d’octubre. Cal retornar a aquestes majories que el que diuen és que no estan disposades a acatar les injustícies d’aquest Estat 
                  espanyol, que l’únic que fa és perseguir els drets dels pobles i els drets de les classes 
                  populars.")

fernandez <- c("Muchas gracias, presidente. Señor Torra, no desaprovecha nunca una oportuni
-
dad para intentar desprestigiar la calidad democrática de España, convencido de que 
ese es el camino. Pero más allá de la opinión de los opinadores a sueldo que tienen 
repartidos por toda Europa y que, por cierto, unos cuantos millones de euros nos 
han costado, como hemos sabido, la realidad es absolutamente tozuda –se ha explicado aquí. Resulta que España es uno de los países con menos sentencias condenatorias del Tribunal de Derechos Humanos de Estrasburgo. Solo seis. Italia, treinta 
y una; Alemania, dieciséis; Portugal, trece; Francia, doce; su adorada Suiza, diez. 
Pero resulta que los malos somos nosotros.
The Economist
 –hay que insistir en ello– señala –esos no están a sueldo de nadie, 
son independientes, de prestigio– que hay diecinueve democracias plenas en el mundo, una de ellas España. Estamos por encima de Francia, de Italia, y valoran todos 
los parámetros de calidad democrática.
Esa es la realidad, y usted se agarra a una sentencia por reorganizar Batasuna 
de Otegi. Arnaldo Otegi. Habla de esa sentencia, y en cambio omite la que tuvo por 
secuestrar y torturar a Luis Abaitua. Le obligaron, a ese pobre hombre, a jugar a la 
ruleta rusa con una pistola y obligarle a dispararse en la sien. Eso hicieron Arnaldo 
Otegi y sus secuaces. Cuando pensábamos que era imposible caer más bajo, cita usted aquí, como referente, a una persona condenada por secuestrar y torturar a otro 
ser humano, en el piso de su inmoralidad, señor Torra, siempre hay un sótano más.
Lo que usted denuncia hoy aquí con tono grave y afectado es en realidad un procedimiento ejemplar de separación de poderes. La abogacía del Estado ha lanzado 
su criterio, que se puede compartir o no, y la fiscalía ha lanzado el suyo, demostrando independencia al no someterse y no plegarse al criterio del Gobierno. Eso es la 
separación de poderes. Ustedes, claro, echan de menos los tiempos en los que Jordi 
Pujol le dictaba, como supimos muchos años después, al juez Estivill las sentencias. 
Ese era el espíritu de la Ley de transitoriedad del 6 y 7 de septiembre, que les convertía a Puigdemont o a usted en auténticos caudillos que dictarían las sentencias judiciales. Ustedes echan de menos aquellos tiempos en los que lanzaban a las masas 
–lo quieren repetir– a presionar a los jueces, como pasó en el caso Banca Catalana. 
Y quieren aprovechar que vuelve a haber un gobierno socialista débil y dubitativo 
para hacer lo mismo. Un gobierno socialista al que le exigimos firmeza democrática 
contra el nacionalismo identitario supremacista que vivimos en Cataluña.
Porque el problema, señor Torra, no es la calidad democrática de España; esa 
lidera todos los estándares europeos de los listados objetivos e independientes, no 
de opinadores a sueldo de su Gobierno. El problema lo tenemos aquí, en Cataluña, 
porque tenemos un presidente que margina a la mitad de la población y les sigue llamando «colonos», porque tenemos un presidente que llama a la insurrección constantemente, y porque tenemos a un presidente de la Generalitat que reivindica, insisto, a un hombre condenado por secuestrar y torturar a otro ser humano.
Dimita, señor Torra, porque aquí la única vía que está agotada es la suya.
Muchas gracias.")

sabria <- c("Gràcies, president. President... «Cada dia que ens mantenen a la presó, el nostre 
moviment es fa més gran, més fort, més creïble, més invencible. La presó serà la 
seva pitjor decisió, perquè serà la seva derrota. El judici i la sentència pesaran com 
una llosa a la història d’Espanya.» Oriol Junqueras, des de la presó de Lledoners. 
(Aplaudiments.)
L’Estat no sembla haver calculat encara el cost que li suposarà aquesta repressió, haver utilitzat els tribunals, tot inventant un relat per castigar els líders socials i 
polítics del nostre país. Han fet una aposta decidida per crear dolor a les nostres famílies, venjança contra un moviment i intentar crear por a la nostra societat. Però la 
seva injustícia, la seva duresa no han aturat ni aturaran el moviment republicà català. L’Estat espanyol caurà –i, de fet, ja hi està caient– en el desprestigi més absolut, 
i és fàcil encertar que Europa acabarà anul·lant també aquest judici, com ho va fer 
ahir amb la decisió d’Estrasburg respecte a la falta de garanties en el judici d’Otegi.
Va passar ahir i tornarà a passar –i amb conseqüències molt més dures–: el castell que han construït s’enfonsarà. Avui, tots els demòcrates catalans i de l’Estat espanyol, aquests que tant trobem a faltar, haurien d’estar de part de les urnes i contra 
un estat i una judicatura que un cop més ens mostra, amb la seva virulència, la seva 
por a la democràcia. Espanya té por de perdre a les urnes. Unes urnes que representen el consens a casa nostra, que representen el consens a Catalunya. Unes urnes que 
són i seran la solució d’un problema que és polític. Unes urnes que són reconegudes 
per aquells que volen la independència, però també per una part molt gran d’aquells 
que no la volen: pel 80 per cent d’aquest país. Sí senyors, som el 80 per cent, com 
bé diu Òmnium Cultural. 
 Unes urnes que ens troben i ens trobaran sempre disposats. A les urnes vam guanyar l’1 d’octubre i estem disposats a tornar-ho a fer quan calgui i sempre que calgui. Perquè és així com volem prendre les decisions a casa nostra: amb pau i amb democràcia. Perquè som demòcrates i les urnes no ens fan mai, mai, mai por.
            Volien fer de la repressió la seva victòria, i la seva repressió, divendres expressada una vegada més en els escrits d’acusació, no són el primer pas per a la sentèn
            -
            cia dels nostres presos polítics, els escrits són la constatació d’una derrota, de la derrota de l’Estat. El paperot que entra divendres la fiscalia és la seva sentencia posada 
            per escrit. El seu relat inventat, construït amb proves falses i amb delictes que no 
            existeixen són la constatació que el sistema judicial espanyol, alimentat per un estat 
            que no canvia en funció de qui governi, vol condemnar la voluntat democràtica de 
            tot un poble. I fer-ho, castigant i generant patiment a persones que formaven part del 
            Govern d’aquest país. I a la presidenta i a la Mesa del Parlament. I als líders de les 
            entitats socials. Volen condemnar-los per escarmentar-los i segellar, així, la veu de 
            la immensa majoria d’aquest poble.
            Però intentant-ho, el que fan és multiplicar aquestes veus. Amplificant la injustícia, fan que traspassi fora de les nostres fronteres, on es jugarà la propera batalla 
            de la democràcia. Ataquen la democràcia, els drets fonamentals, la llibertat i la política, i quan ho fan, l’Estat va perdent legitimitat. La via escollida divideix i genera 
            una dicotomia que acabarà per enfonsar-los del tot. República o violència, democràcia o repressió, urnes o presó. Serà més lent, potser, com a conseqüència d’aquesta 
            repressió ferotge que practiquen, però és irreversible. La democràcia s’acabarà imposant, perquè fins i tot en els pitjors moments tenim clar que la democràcia sempre 
            –sempre– guanya. 
            Qui vol viure en un estat que empresona gent per pensar diferent, per cantar lletres 
            crítiques, per escriure llibres plens de veritats, per tuitejar contra el règim? No contra 
            un, senyor Iceta, contra tots –tots– els que pensen diferent. Qui diu que no seràs el següent si no segueixes la línia que marquen les estructures de l’Estat? És inevitable: o 
            república o repressió. Per sort, al costat de la democràcia, cada dia som més.
            L’Estat espanyol diu amb aquest judici que no l’importa destruir el seu propi estat de dret per defensar la unitat d’Espanya; diu que no l’importa el ridícul internacional, el desprestigi del món democràtic, si així pot retenir els catalans a la força, si 
            així pot garantir la 
            indivisible unidad del régimen..., del reino.
            L’Estat ha demostrat, un cop més, que és absolutament capaç de tot per garantir 
            la seva unitat, i en això, malauradament, no hi ha diferències entre partits. I ho fan 
            perquè l’Estat no és prou madur, no és prou democràtic ni prou fort per parlar de política, per parlar de democràcia, per parlar del dret a l’autodeterminació. L’Estat té 
            tanta por a aquesta democràcia que ha decidit apostar per la repressió per intentar 
            retenir un poble que vol tant i alhora tan poc com decidir sobiranament el seu futur. 
            No tenen projecte per a Catalunya, i d’aquí la seva por de posar-ho a votació. La 
            república és un objectiu viable, possible, que genera esperança, un projecte de canvi, la voluntat de construir entre tots una societat millor, i fer-ho des de baix, repensant-ho tot. L’Estat, en canvi, ofereix repressió, violència, llei mordassa, sentències 
            a favor dels bancs. Volen aturar un poble decidit a decidir, i no podran fer-ho. No 
            ens fan por i no ens aturaran. Fa molt de temps que vam perdre la por. L’1 d’octubre ens vam autodeterminar, i això no té marxa enrere. El consens a Catalunya per 
            resoldre els conflictes és la política i la democràcia, el consens són les urnes, el consens a Catalunya és el no a la monarquia i el sí a la república, el consens a l’Estat ha 
            estat i és encara mantenir la unitat d’Espanya per sobre de qualsevol altra cosa. A les 
            estructures de poder d’aquest Estat no hi ha cultura democràtica, només hi ha cultura d’imposició, i aquesta qüestió només es resoldrà negociant i votant, mai –mai– 
            amb repressió.
            Finalment serà el poble de Catalunya qui decidirà què ha de ser aquest país, encara que ens vulguin empresonar, encara que ens vulguin pegar. Facin-se a la idea 
            que la repressió no els serveix de res, només per generar patiment. Ja fa un any que 
            hi ha gent a la presó, però a les urnes continua guanyant l’independentisme, i aquest moviment no l’aturaran ni amb judicis ni amb cops. La presó i l’exili estan despullant el règim del 78 i tota l’estructura de l’Estat que el sustentava: la monarquia, el 
sistema judicial, els principals partits polítics, els cossos policials, però també les 
grans empreses i les estructures que aguanten un sistema d’interessos que no volen 
perdre el seu poder. Ahir ho vam tornar a tastar: la banca i una suposada justícia 
avantposant el manteniment de l’
statu quo
 per davant dels drets dels ciutadans. 
Avui,  l’independentisme  és  l’únic  moviment  que  està  fent  trontollar  de  debò  
aquest règim del 78 i la seva estructura de poder; avui, l’independentisme és l’únic 
canvi possible. El judici i la sentència no seran només un problema per als presos 
o per a l’independentisme; seran, sobretot, un problema per a l’Estat i per a Europa. Un sol dia de condemna –un sol dia de condemna– ja és una vergonya per a la 
democràcia espanyola. Aquest judici no s’hauria d’haver produït mai. Perquè no es 
condemnen uns fets: es persegueixen idees, es persegueixen adversaris polítics, i 
se’ls tanca a la presó per por a posar unes urnes, per por a una derrota democràtica. 
Però la democràcia no s’atura, ni es jutja ni s’empresona: la democràcia és un tsunami que avança inexorablement i passarà per sobre de tota la repressió que ens imposa un Estat que li té por. I així ho defensa Carme Forcadell des de Mas d’Enric. 
Després d’un any d’una repressió duríssima, estem tossudament alçats defensant 
els drets i les llibertats, i convençuts que, més d’hora que tard, la veritat, la justícia i 
la democràcia s’acabaran imposant.
Moltes gràcies.")

batet_canadell <- c("No podem fer veure que vivim en una situació normal. Hi ha represaliats, exiliats i presos polítics a qui l’Estat demana més de dos-cents anys de presó. Per això jo 
                    acuso l’Estat espanyol de mentir, de vulnerar drets fonamentals i criminalitzar l’independentisme. Exigim l’arxivament de la causa i la llibertat de tots els represaliats. 
                    No ens rendirem. 
                    President Torrent, president Torra, consellers, conselleres, diputats i diputades, 
                    president Torra, tot el suport del nostre grup parlamentari a les mesures que ha exposat; a la retirada del suport al Govern del Partit Socialista, de Pedro Sánchez, amb 
                    la no votació dels pressupostos; a demanar la dimissió del president del Tribunal Su prem, i a tota la campanya internacional, que estic convençut que serà un èxit conjuntament amb el conseller Maragall i la conselleria d’Exteriors.
                    I tota la decepció. Tot el suport però tota la decepció, tota la decepció especialment pels grups parlamentaris de la monarquia i del 155, que avui aquí, en seu parlamentària, tenien una oportunitat –una oportunitat que tenien Ciutadans, que tenia 
                    el PSC i que tenia el Partit Popular, i l’han deixada passar una vegada més– de mostrar una mica d’humanitat –una mica. Ho vam veure aquell dissabte després de l’entrada en presó enmig del ple d’investidura del Jordi Turull, que cap de vostès va gosar aixecar-se i mirar la cara de les famílies, dels familiars..., presos. I ho veiem una 
                    vegada més aquí al Parlament de Catalunya la seva incapacitat d’humanitat davant 
                    de diputats d’aquest Parlament, que són diputats en exercici d’aquest Parlament, com 
                    ho vam aprovar. 
                    Si el senyor Reventós o el senyor Pallach aixequessin el cap, els cauria la cara de 
                    vergonya! 
                    Els cauria la cara de vergonya del Partit Socialista entregat a l’Estat espanyol contra les llibertats, contra els drets humans i 
                    contra els drets civils...I no ens enredin, senyor Iceta, no ens enredin. El problema és tot el sistema judicial. Sí, pot amenaçar, senyor Iceta, pot amenaçar. 
 Ja ho sabem, 
que tenen la fiscalia, per amenaçar, senyor Iceta! Ja ho sabem 
, que tenen la fiscalia, per amenaçar! Però el problema és tot el sistema judicial. I mentre vostès, que estan al capdavant del Govern de l’Estat espanyol, permetin aquestes coses, aquest sistema és tot 
                    un frau democràtic. 
                    I això és el que se li demanaria i se li hauria de demanar a un partit progressista, 
                    perquè ve aquí i parla: «No, un Parlament escollit pel poble», etcètera. Sap quants 
                    diputats  d’aquest  Parlament,  dels  135,  van  ser  escollits  democràticament  i  quants  
                    han hagut de plegar? I vostè creu que això és democràcia real? 
                    Vostè creu que és democràcia real que de tots els diputats que van haver de prendre possessió... Un diputat electe, el conseller Mundó, que va plegar abans de prendre possessió; set diputats que han hagut de renunciar a l’escó, cinc diputades i dos diputats: 
                    la Clara Ponsatí, el Lluís Puig, la presidenta Forcadell –una presidenta d’un Parlament democràtic a la presó per deixar parlar en un Parlament democràtic–, la Marta 
                    Rovira, la consellera Bassa, el conseller Forn, la Meritxell Serret, que van haver de 
                    plegar. Miri quins resultats democràtics que accepten..., quin estat, com garanteix la 
                    democràcia, no? Oh!, i cinc dels quals, d’aquests diputats, són a la presó! I els altres 
                    dos perquè són a l’exili, perquè si no també hi serien. Cinc són a la presó, que els demanen un munt d’anys de presó. 
                    I a més a més en tenim quatre, de diputats d’aquí del Parlament de Catalunya, 
                    que són encausats, com és el company Lluís Guinó, o com és el company i membre 
                    de la Mesa el senyor Joan Josep Nuet, o com són els companys Lluís Salvadó i Josep Maria Jové. Tot és molt normal! 
                    Tot és molt normal, que aquí hi 
                    hagi vint-i-cinc diputats que van prendre l’acta i estiguin tots encausats o a la presó o 
                    a l’exili! Gran normalitat, la de l’Estat espanyol i la que ofereixen vostès. 
                    I mirin, sí: som el 80 per cent. Som el 80 per cent que ja sabem que no hi haurà 
                    un judici just; som el 80 per cent que ja sabem que tot és el mateix, que tota la seva 
                    injustícia és la mateixa. Som la majoria de demòcrates que de cada cop se senten 
                    més interpel·lats, cada cop senten més vergonya davant l’actuació per part de l’Estat 
                    espanyol. L’acusació de la fiscalia és injusta –l’acusació de la fiscalia és injusta–, i si 
                    no poden arribar en llibertat entrant a peu al judici també serà injust. I és injust pel 
                    contingut, perquè és un contingut que va contra el dret de reunió, contra el dret de 
                    manifestació, contra el dret d’acció democràtica política, contra la llibertat d’expres
                    -
                    sió. I és injust perquè es persegueixen idees per damunt de fets. I ara, això sí: venen 
                    aquí, la senyora Arrimadas, tal tal tal, i els donem per condemnats. La separació de 
                    poders existeix a l’Estat espanyol, sí, sí, sí! Però ells ja són condemnats. Ahir ho deia 
                    la ministra Calvo: no, no, ja estan tots condemnats, han comès delictes... I això sí, 
                    això els polítics ho saben, eh? Els diputats, el senyor Rivera, etcètera, tot això ja ho 
                    saben, que no es pot demanar un indult però ja els donem per condemnats. Aquesta 
                    és la gran separació de poders que hi ha a l’Estat espanyol.
                    I tot és el mateix. Tot és la mateixa injustícia. La justícia és ara l’exèrcit, el ma
                    -
                    teix exèrcit de l’any 78. De la remor de sabres hem passat a la remor de togues; del 
                    cop d’estat militar, al cop d’estat dels jutges. I això sí: el rei –el seu rei–, sempre al 
                    mig de tot, defensant-los i tapant-los i cobrint-los, com va fer el dia 3 d’octubre. Miri, tothom sap que la justícia espanyola està qüestionada. I el cas que posa més 
exemple de tot és el del president Puigdemont, que va ser jutjat a Alemanya i com 
que no els agradava el que deien... Sí, sí, es va presentar davant la justícia alemanya, 
i com que a l’Estat espanyol no li agradava, com que a vostès no els agrada el que 
diu la justícia alemanya, que va dir que no hi havia ni rebel·lió, ni sedició, ni desor
-
dres públics... I com que això a vostès no els agrada, que són tan demòcrates, doncs, 
aleshores, retirem l’extradició no sigui cas que hagi de venir aquí i no sigui cas que 
pugui tornar a ser president de la Generalitat de Catalunya, que això els esveraria 
d’una forma enorme. 
(Remor de veus.)
 Aquesta és la seva democràcia. Sí, sí, riguin 
–riguin–: riguin, perquè nosaltres, en una nova república, el que no demanarem mai 
a la vida és que el que ens està passant a nosaltres els passi a vostès. 
(Aplaudiments.)
Perquè tots hem de ser iguals, i tothom ha de tindre els mateixos drets i els mateixos 
deures! I hi ha el deure..., d’acció política, ideològica i de llibertat d’expressió. 
Miri, el mateix tribunal que decideix sobre la nostra democràcia i els nostres líders polítics és el mateix tribunal que decideix a favor de la banca. Som molts els 
que ja hem decidit passar pàgina. 
Senyor president, la societat catalana ha trencat d’una forma definitiva amb l’Estat espanyol. Les oportunitats que té, l’Estat espanyol, les va perdent. Ja hem vist 
que no hi ha diferències entre el tripartit del 155: entre ells es defensen, com defensen el senyor Borrell, com..., es defensen les seves vergonyes. «Quant temps un 
poble haurà de patir per manca de llibertat? Fins quan seguirà l’home girant el cap 
fingint que no hi veu res?» El poble de Catalunya ja hi veu clar, i veu que la llibertat 
es diu «república catalana».
Moltes gràcies a tots i a totes.")

aragones <- c("Moltes gràcies. Senyor president, senyores i senyors diputats, president de la Generalitat, conselleres, consellers, intervinc per fer la rèplica en nom del Govern, tal 
com permet el Reglament, malgrat que faci riure els diputats de Ciutadans; malgrat 
això, nosaltres complirem amb el Reglament, 
 i per tant faré, doncs, la rèplica en nom del Govern encara que no li agradi.
Ha començat la senyora Arrimadas, diu: «Vienen a hablar de lo de siempre». No. 
Diu: «No han parlat ni de la salut, ni de l’ensenyament, ni de la situació dels funcionaris...» Ho comprovarem, que vostès també segueixen parlant del de sempre, i 
d’aquí a poca estona en les preguntes orals al Govern veurem que vostès segueixen 
preguntant pel de sempre: sobre l’acció exterior..., 
sobre el uso de las lenguas en las 
escuelas
. No han vingut a parlar..., després, a la sessió del Govern, tenien l’oportunitat de parlar de metges, de funcionaris, però vostès segueixen amb el monotema. 
Certament, de metges i de funcionaris en podríem parlar, i podríem adoptar moltes més mesures si vostès no s’entestessin, des del Congrés dels Diputats, a limitar, 
mitjançant la regla de la despesa, participant d’aquest consens, la capacitat d’utilitzar els recursos de la Generalitat de Catalunya, si vostès permetessin també l’augment del sostre de dèficit, i, per tant, més recursos per a l’any que ve per atendre 
també les necessitats dels ciutadans de Catalunya.
Però  anem  a  la  intervenció,  al  que  ha  motivat  les  paraules  del  president  de  la  
Generalitat de Catalunya, que és la denúncia política de les acusacions que es van 
fer públiques per part de la fiscalia i l’Advocacia General de l’Estat, en un context d’absoluta anormalitat, en un procediment judicial que està tenyit políticament, totalment –totalment–. Perquè de fet el que es jutja són uns esdeveniments polítics. 
              I es jutgen uns esdeveniments polítics per part d’una cúpula, d’un poder judicial, que 
              està contínuament qüestionat. De fet, s’autoqüestiona ell mateix; de fet, deia el senyor Iceta que persistíem a intentar, doncs, denunciar el prestigi de l’Estat espanyol i 
              de la justícia espanyola. De fet ho fa el mateix suprem: amb les seves decisions diàries ells mateixos enfonsen el seu prestigi.
              Deia la senyora Arrimadas que el president de la Generalitat ha vingut aquí a defensar el senyor Otegi. No, ha vingut aquí a publicar la sentència del Tribunal Europeu de Drets Humans d’Estrasburg; no el senyor Otegi: Tribunal Europeu de Drets 
              Humans d’Estrasburg, aquell del qual li sembla a la senyora Arrimadas que sis sentències en les que en dues es qüestiona que no hi hagi hagut un judici just li semblen 
              poques. A mi una sola sentència em sembla excessiva, una sola sentència em motivaria a prendre mesures. Mesures com, per exemple, la que s’ha negat el Govern de 
              l’Estat..., de signar el Protocol 16 de la Convenció europea de drets humans per tal 
              que els jutges puguin fer una consulta prèvia al Tribunal Europeu de Drets Humans 
              si, a petició d’una de les parts, creuen que pot haver-hi hagut alguna vulneració, per 
              evitar després –com es permet, per exemple, amb el Tribunal de Justícia de la Unió 
              Europea en el cas de la normativa comunitària– que hi hagi un revés, una correcció. 
              Però sembla que aquesta mesura tampoc val la pena plantejar-la.
              No estem en un context de normalitat. No estem en un context de normalitat perquè aquí el que es produeix no és una reclamació d’impunitat per als presos polítics, 
              perquè aquí la impunitat, quan hi ha una presó preventiva que es dicta en base a un 
              delicte de rebel·lió que el seu autor material, l’autor de la redacció del delicte de rebel·lió en el Codi penal diu que no s’ha produït, quan les jurisdiccions d’altres estats on 
              s’ha passat la prova del cotó ha sortit ben negre, perquè no s’ha produït aquest delicte de rebel·lió, i que és pel que els mantenen en presó preventiva i és pel que el jutge 
              Llarena dicta la suspensió del seu exercici de diputats... Qui té impunitat, doncs, és 
              la justícia de l’Estat espanyol, que manté aquesta presó preventiva; qui té impunitat 
              són aquestes investigacions judicials sense capacitat de defensa. Una presó preventiva que, si continua, impedirà que hi hagi un judici just, perquè impedirà la capacitat de defensa; jornades de judici de matí i tarda, amb trasllats des de la presó, amb 
              trasllats en unes condicions inacceptables, sense capacitat de defensa, en què entre trasllat i presència al judici se’ls manté en uns calabossos que no passarien tampoc la prova del cotó del Protocol facultatiu de prevenció contra la tortura, perquè 
              no tenen obertura exterior, que només hi ha uns foradets a la porta, pintats tots del 
              mateix color... Això no és el dret de defensa. Per molt menys, el Tribunal Europeu 
              de Drets Humans ha tombat la sentència del cas Betaragune, que afectava Arnaldo 
              Otegi. La impunitat dels informes filtrats de la Guàrdia Civil, que veiem abans en 
              els mitjans de comunicació de què se’ns investiga, de què se’ns acusa, de quines..., 
              no?, de com se’ns busquen les pessigolles, abans de que ho vegin ni tan sols les defenses a nivell parlamentari; abans ho saben els periodistes que els afectats.
              I després vostè ha fet servir... Fa servir algunes paraules que suposo que li van 
              molt bé per al seu relat fictici, quan parla de «
              comandos
              », d’aquests suposats 
              comandos
              liderats pel president de la Generalitat. Però a mi m’agradaria parlar, com ha fet 
              la diputada de la CUP, Natàlia Sànchez, com ha parlat ella, d’aquests 
              comandos
              que 
              resulta que han anat a Verges, no?, i que han deixat el poble ple de pintades, algunes 
              d’elles insultants; d’altres: «Viva la Guardia Civil» –suposo que deuen comptar-ho 
              com una agressió, això–, «Ni oblit ni perdó per als colpistes», «Tots som Espanya», 
              insults al president, insults també... Resulta que una pancarta de «Necessitem institut escola» dirigida a la Generalitat, doncs, també és fruit de la seva ira. Aquests 
              comandos
              vostès no els denuncien. Que estrany. Denunciïn-los, també. 
              I després vostès continuen amb el seu relat, que diu: «És que segurament la gent 
              que mira TV3 això no ho saben», i suposo que quan diuen això ho fan per a la gent precisament que no mira TV3, no?, perquè es pensin que TV3... I crec que s’hau
-
              rien d’estalviar aquestes paraules, aquest menyspreu continu als professionals dels 
              mitjans públics de Catalunya, sobretot quan amb les darreres dades es veu que el 
              partit que va ocupar més temps en el telenotícies precisament d’aquests mitjans públics que segons vostès són tan dolents era el seu partit, i d’àmbit estatal era el Partit Popular. Per tant, crec que haurien d’estalviar-se aquestes paraules de menyspreu 
              per als periodistes dels mitjans públics de Catalunya.
              El senyor Iceta deia que Catalunya no és un país oprimit; podríem discutir-ho. 
              Diu: «Hi ha un parlament», i hi han uns llaços grocs, senyor Iceta. Hi ha un parlament, sí, però hi han llaços grocs. Hi ha un parlament, sí, però els resultats del 21 de 
              desembre..., no poden accedir a l’escó tots els seus diputats. Hi ha un parlament, sí, 
              però els candidats a la investidura no poden venir aquí, desmentint la jurisprudència 
              anterior que hi havia quan eren condemnats per terrorisme. 
              (Aplaudiments.)
              Diu que el president de la Generalitat no pot parlar en nom del poble de Catalunya, que en tot cas ho ha de fer de la meitat dels electors; però quan el president 
              de la Generalitat parla de la necessitat d’acabar amb la presó preventiva potser ho 
              fa en nom de la meitat dels electors d’Espanya, perquè resulta que a la darrera enquesta publicada a 
              El Periódico de Catalunya
              diu precisament que la meitat de tots 
              els  ciutadans  de  l’Estat  espanyol  creu  que  la  presó  preventiva  s’ha  d’acabar,  s’ha  
              d’acabar per als nostres companys i companyes que estan encausats pel delicte de 
              rebel·lió. De fet, el 47 per cent dels electors del PSOE i el 30 per cent dels electors 
              de Ciutadans de l’Estat espanyol hi estan d’acord. Suposo que tots aquests deuen 
              ser els que deuen mirar TV3 i Catalunya Ràdio, no?, senyora Arrimadas. Déu-n’hi-
              do, els electors de Ciutadans a nivell de l’Estat que també..., o els comprats –o els 
              comprats–, són els opinadors comprats que té el Govern de Catalunya, i ja li dic jo 
              que el pressupost de la Generalitat no està per comprar el 30 per cent dels electors 
              de Ciutadans a nivell de l’Estat. I el 81,1 per cent dels catalans considera que no han 
              d’estar en presó preventiva.
              El senyor Iceta diu que això ve d’un fracàs de la política, i la qüestió és: cal persistir en el fracàs?, cal persistir en continuar fracassant? –i fa amb el cap que no. 
              Doncs això s’hauria de traduir en fets i, per tant, canviar la línia que va mantenir el 
              Govern Rajoy, canviar aquesta línia repressiva, i revertir-la. Perquè, evidentment, el 
              que s’ha plantejat no és una reversió d’aquesta línia, no és una reversió, perquè s’assumeixen relats que vostès saben..., perquè vostès tenien alcaldes i alcaldesses l’1 
              d’octubre que potser no van votar però que estaven veient el que passava als col·legis, 
              alguns dels quals es van enfrontar als operatius policials, que saben que allà, que 
              saben que el que va passar allà no és el que diuen els escrits de la Guàrdia Civil que 
              assumeix la fiscalia i l’Advocacia General de l’Estat. Per tant, hi estem d’acord, no 
              caldria persistir en el fracàs; comenti-li al senyor Sánchez, al senyor Pedro Sánchez, 
              que no persisteixi en el fracàs de la via repressiva de Mariano Rajoy.
              I vostè ha estat parlant d’uns esdeveniments aquí al Parlament, presumint que 
              són il·legals, en tot cas, d’un eventual delicte de desobediència, que no s’assembla en 
              res a un delicte de rebel·lió, que no s’assembla en res, una multa, a trenta anys de presó o a vint-i-cinc que demanen per a Oriol Junqueras. I nosaltres en discrepem. No 
              es partirà de zero en aquest judici, per molt que les defenses facin tot l’esforç perquè 
              sigui així, perquè quan s’està en presó preventiva, quan no tens capacitat de defensa, quan estàs vuit hores davant d’un tribunal i hauràs de tornar a la teva cel·la, passant per la cel·la de l’Audiència Nacional, on no podràs parlar amb el teu advocat per 
              defensar-te, aquí no es parteix de zero. No hi haurà igualtat de condicions. I el que 
              estaria bé és que no esperem a una sentència del Tribunal de Drets Humans d’Estrasburg que d’aquí uns anys ens digui que no va haver-hi un judici just. Actuem ja, 
              perquè les actuacions siguin imparcials i justes, que fins ara no ho han estat, senyor 
              Iceta –no ho han estat. No ho han estat, i fixi’s vostè, que diu: «La justícia es por criticar, sí. Nosaltres 
ho fem sovint, quan no ens agrada», i ha posat un exemple de la crítica que vostè fa 
              al Tribunal Suprem en el cas de les decisions, aquestes anades i vingudes, autocorreccions, sentències dictades, corregides automàticament sense recurs de les parts 
              –això, a la Llei orgànica del poder judicial no sé on es troba, francament, ni a la Llei 
              d’enjudiciament de la jurisdicció contenciosa administrativa, que em sembla que és 
              la que aplica el cas–, i diu: «Llavors ha d’actuar. I actuarem des del Congrés dels Diputats.» Doncs perfecte, ja en veuen la via. Per què no actuen des del Congrés dels 
              Diputats en el cas també dels nostres companys i companyes que estan acusats de 
              delicte de rebel·lió? O és que aquest no és tan important? O és que aquest crítica no 
              és tan sincera, no és tan honesta? A mi m’agradaria creure que sí. 
              Per tant, també actuïn, evidentment, perquè el poder judicial no està sol, el poder 
              judicial no està aïllat i, evidentment, ha d’aplicar allò que diuen les lleis. Allò que 
              diuen les lleis precisament..., diu: «Els polítics fem les lleis, els legisladors fan les 
              lleis i els jutges les interpreten.» Però quan precisament –i ho comentava fa, doncs, 
              dos minuts– el diputat que després ha estat alt càrrec del Partit Socialista Obrer Espanyol i diputat del Partit Socialista Obrer Espanyol, que va redactar l’article del Codi 
              penal que fa referència a la rebel·lió diu que el que s’ha produït no és rebel·lió, doncs, 
              resulta que aquí hi ha algú està interpretant molt malament les lleis, entre ells una fiscalia general l’Estat que avala les acusacions de fins a vint-i-cinc anys de presó.
              I diu que és un error barrejar-ho amb els pressupostos generals de l’Estat. El que 
              és un error és intentar confondre la gent. El que és un error conscient –per tant, una 
              mentida conscient– és dir que cal aprovar els pressupostos generals de l’Estat perquè 
              s’augmenti el salari mínim, quan això pot ser aprovat per decret llei; i em remeto al 
              darrer augment del salari mínim, per exemple. El que és una mentida conscient és 
              dir que calen els pressupostos generals de l’Estat perquè arribin els recursos de finançament que corresponen a Catalunya i que augmenten com augmentaran a la resta de comunitats autònomes, en estricta aplicació –restrictiva, a més– de la Llei de 
              finançament de les comunitats autònomes. El que no és cert és dir que es depèn dels 
              pressupostos generals de l’Estat perquè arribin dues dècimes més, extres, de dèficit autoritzat, perquè depèn de la Llei d’estabilitat pressupostària, i no de la Llei de 
              pressupostos de l’Estat.
              Per tant, d’aquests 2.200 milions que vostès diuen que arribaran a Catalunya, 
              quants d’aquests 2.200 milions són només per a Catalunya i quants d’altres estan relacionats amb l’augment que tindrà la resta de comunitats autònomes? Perquè jo li 
              dic una cosa: si aquests 2.200 milions fossin d’una decisió que beneficiés només a 
              Catalunya, fossin exclusius per a Catalunya, els seus barons del Partit Socialista d’altres comunitats autònomes ja haguessin aixecat la mà queixant-se, com fan sempre 
              que hi ha un acord bilateral entre Catalunya i el Govern de l’Estat. Per tant, això demostra perfectament que aquesta fal·làcia dels 2.200 milions no s’aguanta per enlloc, 
              senyor Iceta. 
              La diputada Albiach, de Catalunya en Comú..., coincidim amb el que ha expressat, el Govern hi coincideix, i creiem que tenim molt de camí a recórrer. Coincidim 
              amb que cal construir grans consensos, aquests consensos del 80 per cent. I a nosaltres no ens agradaria quedar-nos al vuitanta: volem arribar al cent per cent, volem 
              arribar al cent per cent de ciutadans a Catalunya. Però a aquell 80 per cent que està a 
              favor del dret a decidir jo afegeixo també aquell 80 per cent que advoca per la fi de 
              la repressió, que denuncia l’actual monarquia com a estructura del règim que ens governa. Per tant, nosaltres coincidim a treballar en aquest 80 per cent que va molt més 
              enllà dels votants de Junts per Catalunya, d’Esquerra Republicana, de la CUP i dels 
              Comuns, va més enllà; també hi ha votants que donen suport a aquestes idees en la 
              part 155 de l’hemicicle. Per tant, nosaltres donem suport a aquesta idea del 80 per 
              cent, saludem amb tota la complicitat la iniciativa d’Òmnium Cultural i, hi insisteixo, el nostre projecte és per al cent per cent de la ciutadania també. I coincidim que cal plantar cara a l’extrema dreta, i precisament per això hem 
impulsat una oficina de drets civils i polítics, precisament per això el Cos de Mossos 
              d’Esquadra fa les seves actuacions també, no per l’extrema dreta, per dreta, sinó per 
              extrema, per la violència amb la que actua, per la vulneració de la propietat, la vulneració de l’espai públic que provoca aquesta extrema dreta.
              I feia una crida a l’empatia i a acordar els termes del debat. Tenim una oportunitat: 16 de novembre, trobada amb tots els grups parlamentaris; esperem que hi siguin tots. Senyora Arrimadas, l’esperarem, hi haurà una cadira per a vostè, com hi 
              ha estat sempre, i esperem que vulgui parlar amb la resta de grups parlamentaris i 
              amb el president de la Generalitat i amb mi mateix. Oberts a parlar de tot, per tant, 
              oberts a treballar en l’ordre del dia, a poder incloure totes les propostes.
              Pel que fa a la intervenció de la CUP, coincidim, evidentment, amb el que s’ha 
              exposat. Crec que ha estat molt oportú tot el record de les diferents condemnes del 
              Tribunal Europeu de Drets Humans a l’Estat espanyol. De fet, de sis condemnes de 
              l’Estat el darrer any, dos han estat per no haver-hi hagut un judici just; de les tretze de Bèlgica, una. Per tant, quan algú a vegades algú fa comparació, eh?, que vegi 
              exactament sobre que són les condemnes. I una justícia europea que ha corregit els 
              dos grans elements que sembla, a dia d’avui, que sustenten els principis fonamentals 
              de la cúpula judicial a l’Estat espanyol, que són la unitat d’Espanya i els beneficis 
              dels mercats financers, i els dos ja els ha corregit i els continuarà corregint. El Tribunal de Justícia de la Unió Europea ho ha fet reiteradament amb les clàusules sòl en 
              les hipoteques, estem convençuts que ho farà també en el cas del que s’ha corregit 
              aquesta darrera setmana, i el Tribunal Europeu de Drets Humans ho ha fet en diverses ocasions i, si no hi ha una correcció abans, ho farà també en el procediment que 
              segueix contra els nostres companys i companyes. 
              I tornem a insistir en la necessitat i crec que, si ens prenem seriosament el que diu 
              el Tribunal Europeu de Drets Humans, torno, doncs, a plantejar al senyor Iceta una 
              proposta que és: digui-li a en Pedro Sánchez que signin el Protocol 16 de la Convenció europea de drets humans i permetin, que quan algun jutge tingui un dubte sobre si l’aplicació de la llei de l’Estat afecta els drets humans, pugui fer la consulta a 
              aquest tribunal i estalviar-nos correccions futures per part del Tribunal d’Estrasburg.
              I estem d’acord, diputada Sànchez, que l’acusació s’ha construït sobre un relat 
              fals. El diputat Alejandro Fernández, del Partit Popular, diu que el president Torra 
              no desaprofita qualsevol oportunitat per atacar la democràcia espanyola i el poder 
              judicial. El senyor Torra, en aquest cas, té un competidor absolutament deslleial en 
              fer això, perquè el guanya per golejada, que és el Tribunal Suprem. El Tribunal Suprem no perd cap oportunitat per qüestionar-se a sí mateix i qüestionar la legitimitat 
              de la cúpula judicial espanyola. D’aquesta legitimitat que qüestionen el que vostè en 
              diu «opinadors a sou», que deu ser la jurisdicció belga, la jurisdicció d’Escòcia, la 
              jurisdicció d’Alemanya, el Tribunal Europeu de Drets Humans... Vaja, no sé que..., 
              no crec que tinguem tanta gent en nòmina, a la Generalitat.
              I vostè, agafant-se a la sentència d’ahir, del Tribunal Europeu de Drets Humans, 
              que ha posat com a exemple el president de la Generalitat, relativa al senyor Arnaldo Otegui..., ja ha fet, doncs, aquí..., agafa, doncs, d’una qüestió marginal, en fa el 
              centre del seu discurs. I parla de: «La immoralitat, de tortures...» Sap el que és una 
              immoralitat? Que el senyor Zoido mantingués la medalla al mèrit policial a Billy 
              el Niño, un torturador reconegut durant el temps del franquisme. Sap el que és una 
              immoralitat, parlant de torturadors? Que es posés una persona acusada per tortures, 
              precisament, al cas Urra, els anys noranta, al País Basc, com a cap de l’operatiu policial per carregar contra les escoles l’1 d’octubre: el senyor Pérez de los Cobos. Que 
              recordi, que vostès van posar al capdavant d’un operatiu, quan tenia antecedents per 
              tortures, això sí que és una immoralitat, senyor Fernández, això sí que és una immoralitat. El diputat Sabrià i el diputat Batet, d’Esquerra Republicana, Grup Republicà, i de 
Junts per Catalunya, evidentment, el Govern comparteix, compartim la seva posició. 
És cert que, els elements més fonamentals i que menys han evolucionat en aquests 
anys de règim de restauració borbònica des del franquisme: la monarquia i la cúpula 
del poder judicial, estan en deslegitimació contínua. I ens afrontem a aquesta disjuntiva de república o repressió, una república o repressió que nosaltres creiem..., aquesta disjuntiva, que només superarem apel·lant els consensos del 80 per cent amb els 
que abans comentàvem amb la diputada Albiach, de Catalunya en Comú.
Per tant, és a través d’aquests grans consensos que adquirirem la força democràtica en aquest país per superar aquesta disjuntiva, una disjuntiva que només es pot 
superar a base de democràcia, de reconeixement dels drets de tothom. Una disjuntiva de república o repressió, que explica clarament..., s’explica clarament quan, en 
la inauguració de l’any judicial, el president del Consell General del Poder Judicial 
i president del Tribunal Suprem diuen que: «El fonament últim de l’estat de dret a 
Espanya és la unitat d’Espanya.» No els drets dels ciutadans, no la divisió de poders, 
no, no: la unitat d’Espanya. Per tant, l’estat de dret que alguns defensen, no és un 
estat de drets, a Espanya. No és un estat de drets, en tot cas és només Estat. Estat i 
unitarisme estatal.
El diputat Batet ha..., evidentment, doncs, ha explicat clarament els problemes de 
la cúpula judicial. Coincidim que estem en una anomalia extrema, que quan s’apel·la 
a aquest Parlament no podem tapar-nos els ulls davant de l’anormalitat que suposen aquests llaços grocs, davant de l’anormalitat del que signifiquen aquests llaços 
grocs, que és que els nostres companys i companyes estiguin a la presó. I no podem 
tancar els ulls quan no es respecten, per part del poder judicial, quan no es respecta 
la divisió de poders per part del poder judicial, en intentar influir sobre els resultats 
del 21 de desembre. 
Per  tant,  el  Govern  de  Catalunya  continuarà  compromès,  com  ha  expressat  el  
president, compromès amb la solució política, amb el diàleg polític, a treure les causes polítiques dels tribunals i posar-les en una taula de negociació política. Tenim 
tres divises: llibertat, absolució i autodeterminació. Tres consensos del 80 per cent, 
que estem convençuts que aconseguirem.
Moltes gràcies.")

# Previous ple

combined <- 
  c(aragones,
    arrimadas,
    # batet_canadell,
    iceta,
    sabria,
    fernandez,
    sanchez_dipp,
    albiach,
    torra)
combined_names <- c('Aragonés',
                    'Arrimadas',
                    # 'Batet Canadell',
                    'Iceta',
                    'Sabrià',
                    'Fernández',
                    'Sánchez Dipp',
                    'Albiach',
                    'Torra')

# https://www.parlament.cat/web/documentacio/publicacions/diari-ple/index.html
# sessio 19.1 ordinaria 7 nov 2018
combined_df <- data_frame(
  person = combined_names,
  date = '2018-11-07',
  sessio = 'Sessió ordinaria 19.1 7 nov 2018',
  txt = combined
)


carrizosa <-
  c("Buenas tardes, 
bona tarda a tothom
    . Hoy, martes, teníamos un debate de política 
    general, y digo que lo teníamos, porque lo que tenemos hoy ya no es el debate nor
    -
    mal, en un parlamento normal, de política general. Miren, todos los diputados repre
    -
    sentamos, o deberíamos representar a los catalanes y, en concreto, este diputado que 
    les habla, representa a más catalanes, decenas de miles de catalanes más que el si
    -
    guiente grupo más votado en esta cámara. Y es inconcebible que, hasta el momento 
    mismo de levantarme y tomar palabra ante estos micrófonos, no teníamos claro que 
    este pleno fuese a empezar.
    No teníamos claro que pudiéramos hablar, no teníamos claro si se iba a liar otra 
    de estas que ustedes lían, porque intentan acomodar el Reglamento del Parlament a 
    sus propios deseos. Es una vergüenza, es una vergüenza absoluta que este discurso 
    que tenía preparado, pues, haya cambiado hasta tres veces, dependiendo de las cir
    -
    cunstancias a que ustedes nos han llevado, a los ritmos que ustedes nos imponen. 
    ¿Eso es lo que ha de hacer un parlamento en un país normal? –¿Eso es lo que ha de 
    hacer un parlamento en un país normal? Pues no, señor Torra, esto no es lo normal, 
    no es normal que se cambien las reglas del juego al compás del interés de aquellos 
    que arrasan con todo, para llegar a hacer lo que ustedes quieran.
    Esto es una vergüenza, un ridículo, un desprestigio para este Parlamento y una 
    indignidad. Y yo, lo que les digo es que así creo que nos sentimos buena parte de los 
    diputados de esta cámara, que no sabemos cuándo vamos a tener pleno y cuando no, 
    y qué es lo que van a imponer en cada pleno ustedes. Yo creo que así se siente, inclu
    -
    so, el personal de este Parlamento, que sabe a qué hora entra y a qué hora supuesta
    -
    mente vamos a hacer un pleno, pero luego no se sabe nunca a qué hora acaba y si el 
    pleno que se había de celebrar se celebrará o no. Así se sienten los periodistas, que 
    los periodistas tampoco saben qué es lo que va a pasar, estamos todos al ritmo de, a ver qué es lo que a ustedes se les ocurre en cada momento. Y yo he oído, incluso, y ya ha sido lo último, que me he quedado ya pasmado, 
en las últimas comparecencias de prensa que ha hecho alguno de los partidos sepa
    -
    ratistas, ya se oían hasta risas en los bancos de los periodistas, por lo ridículo y lo 
    estrafalario de la situación, por lo inconexo de las explicaciones, por cómo se pre
    -
    tende decir una cosa, pero en realidad se quiere decir otra, y no se sabe por dónde 
    se puede salir... Así están ustedes, ¿eh?; pero, sobre todo, más que diputados, más 
    que personal de la casa, más que los periodistas, los ciudadanos. ¿Qué piensan los 
    ciudadanos de este espectáculo que están dando ustedes en el Parlamento de Cata
    -
    luña? Por eso les digo que esto no es un debate de política general, porque las noti
    -
    cias que les van a llegar a los ciudadanos, lamentablemente, no van a ser, priorita
    -
    riamente, pues, que hayamos llegado a un acuerdo sobre cómo reducir las listas de 
    espera en sanidad, o un acuerdo que avance algo en infraestructuras, o un acuer
    -
    do sobre impuestos, sobre las cosas que les importan a los catalanes. No va a salir 
    nada de eso.
    Y no va a salir nada de eso, porque este Pleno, desgraciado, este Pleno que ya se 
    ha cancelado –se canceló la semana pasada y lo celebramos esta–, viene precedido 
    por esos malos augurios que ya anunciaban todos estos desenlaces penosos, de una 
    semana negra que tuvimos, que empezó, pues, con cortes de carreteras, con amena
    -
    zas, con agresiones, con señalamientos, con un intento de asalto al Parlamento, con 
    intentos de retorcer el Reglamento para que vote quien no puede votar, porque está 
    suspendido por los jueces. Porque tenemos un 
    president
    que, cuando sale en las no
    -
    ticias, sale como noticia porque enaltece, apoya, anima, a los comandos separatistas, 
    los anima a que «aprieten», ¿Aprieten a quién? 
    ¿A  qui?
    ¿A Ciutadans? No, a los ca
    -
    talanes –a los catalanes–, para cortarles la carretera, para que no lleguen a tiempo a 
    llevar a sus hijos al colegio, o no lleguen a tiempo a una prueba del médico, o no..., 
    para hacerles la vida lo suficientemente insoportable... Apriete usted a los ciudada
    -
    nos de Cataluña para hacerles la vida tan insoportable que, al final, tengan que clau
    -
    dicar ante los..., disculpen, vividores del 
    procés.
    (Alguns aplaudiments.)
    Eso es lo que ustedes hacen. Tres meses –tres meses– con este Parlamento cerra
    -
    do. Y cuando lo abren, el ridículo y la vergüenza. Hoy las noticias son: no va a ser 
    como decía, esos acuerdos propios de un debate de política general, esas votaciones 
    más o menos ajustadas, por si el Gobierno hará o no hará aquella propuesta que pro
    -
    ponía la oposición, un pacto sobre algo que interese a los catalanes..., no. Hoy la no
    -
    ticia es la pelea entre Esquerra Republicana y Junts per Catalunya. Esa es la noticia, 
    hoy, eso es lo que le va a llegar a los ciudadanos.
    Miren, el otro día Inés Arrimadas decía en su discurso: «Es que hay poblaciones, 
    entre Mataró y Sabadell o entre Reus y Tarragona, que tienen más de cien días de 
    lista de espera para hacer algunas pruebas médicas.» Que eso es un tema de gestión, 
    de pura gestión, que les compete a ustedes, al Gobierno. Al Gobierno, esas cosas, 
    quedan pospuestas, quedan detrás, quedan escondidas. ¿Por qué? Porque a ustedes 
    les interesa que se hable solamente del 
    procés
    . Y como el 
    procés
    lo tapa todo, al fi
    -
    nal, hasta sus propias peleas son lo que queda.
    Usted,  señor  Torra,  pedía  a  los  separatistas,  a  los  comandos  separatistas,  que  
    «apretasen» a todos los ciudadanos de Cataluña, a ver si les hacen la vida suficien
    -
    temente insoportable. Nosotros lo que le pediríamos y le pedimos es que apriete a 
    su Gobierno, que les apriete, pero no para el 
    procés
    , no, para que consigan, pues, 
    que  nuestra  policía  vuelva  a  ser  una  policía  aceptada  por  todos  los  ciudadanos  y  
    que..., libre de sospechas de politización, o que la educación empiece a ser respetuo
    -
    sa con todos, en las aulas; o que la acción exterior no sirva, pues, para echar lodo so
    -
    bre el nombre de España. O para que la cultura no esté mediatizada y fanatizada por 
    el manifiesto Koiné. O para que en justicia no se dé a los presos un tratamiento pri
    -
    vilegiado, dependiendo de si son amiguetes o no lo son, o son políticos o no lo son.
    Con lo que sabe la 
    consellera
    , que lo sabe muy bien, cuánta gente está presa y no 
    ha tenido tantas oportunidades y tantos avisos y, sin embargo, se les aplica con ri
    -gor el reglamento penitenciario, señora 
consellera
    . Cuidado con esas cosas, que son 
    muy feas, y usted lo sabe, además, me consta. Pero, bueno, todo, por tanto, en este 
    debate de política general es inútil, cuanto yo les pueda decir. 
    Miren, tenemos decenas y decenas de propuestas sobre educación y cultura, so
    -
    bre sanidad, sobre agenda social, sobre igualdad de género, sobre protección de las 
    personas más vulnerables, sobre la calidad de la vida de las personas en las políticas 
    del territorio, sobre quitar grasa y fomentar músculo en una administración para que 
    no nos cueste tan cara y que las clases medias y populares no sean las que pagan 
    más impuestos de toda España.
    Todas esas medidas, al final, quedan pospuestas por sus peleas en el 
    procés
    . Mi
    -
    ren, ustedes ya han roto, también, este Parlamento. Han roto muchas cosas, han roto 
    sus partidos políticos, han roto la sociedad catalana, han roto muchísimas cosas..., 
    pero ahora ya han roto, también, la confianza de los ciudadanos en que aquí, en un 
    parlamento, hagamos cosas que, a ellos, de verdad, les solucionen la vida y les sir
    -
    van para algo. No vamos a poder hacer ese debate de política general normal.
    Ustedes, en este debate, por ejemplo, una de las grandes noticias que recuerdo 
    que salieron la semana pasada, y que ya casi nos hemos olvidado, porque otras co
    -
    sas, simplemente el cumplir o no con las resoluciones judiciales han ocupado más 
    el foco; pero ustedes, ¿qué se traen a este Parlamento? Se traen, por ejemplo, repro
    -
    bar al rey. ¿Por qué? ¿Porque le tengan mucha manía? No, porque el rey es el sím
    -
    bolo que representa a todos los españoles. Y como ustedes odian a España y, ade
    -
    más, algunos de ustedes, como buenos supremacistas, encima insultan y odian, y no 
    pueden ni ver a los españoles, pues entonces, ¿qué hacen? Pues, arrían las banderas 
    de sus ayuntamientos. ¿Verdad, señor Batet?, las banderas españolas, o reprueban 
    al rey. ¿Por qué? Porque es un símbolo que representa esa unión, la solidaridad, la 
    igualdad entre todos los españoles.
    Sí, sí..., señores supremacistas, que se ríen porque entiendo que son presididos 
    por un señor que insulta a la gran mayoría de la población catalana. Miren, para aca
    -
    bar ya..., ya hemos hablado de cuántas cosas proponemos, pero este debate de políti
    -
    ca general, si tiene algún sentido, también, es para poner de manifiesto que ustedes, 
    ahora, ya, lo que les toca, después, además, de lo que estamos viendo hoy, es que 
    asuman, asuman su derrota y empiecen a gestionarla. Ustedes no han sabido llegar 
    al fin del camino unidos. Dejen ya de mentir, dejen de provocar vergüenza, de hacer 
    el ridículo. En su república imaginaria, los diputados no están suspendidos; pero, en 
    realidad, lo que todos los catalanes sabemos es que sí que lo están. Y que no van a 
    poder votar. No nos den más plenos para la vergüenza y para el ridículo. Miren, yo 
    creo que los constitucionalistas tenemos profundas diferencias, entre nosotros, pero 
    por lo menos, respetamos unas reglas del juego comunes, que luego podremos cam
    -
    biar, pero la diferencia entre nosotros y ustedes, es básicamente esa.
    Y ustedes, no respetan ni siquiera las reglas inventadas de las que se dotan, por
    -
    que luego, como los trileros, se hacen trampas unos a otros y se pegan puñaladas. 
    Miren, los catalanes y el resto de los españoles no vamos a aguantar mucho más 
    tiempo tantas mentiras, tantos desprecios. A veces, hay que llegar al fondo, y en 
    el fondo, pegar una patada para salir a respirar, a respirar el aire a la superficie. Yo 
    creo que a algunos de los que nos han arrastrado hasta el fondo, difícilmente van a 
    dar esa patada, porque no les veo propósito de enmienda. Yo creo que ustedes van 
    a quedar atrapados......en el cieno de la profundidad donde nos han llevado.")

granados <- 
  c("Gràcies, president. President, consellers, diputats i diputades..., ens ha costat –ens 
ha costat– tres mesos, però finalment sembla que s’ha posat seny en aquest Parla
    -
    ment. Però és evident que hem ofert un espectacle al conjunt de la ciutadania del nos
    -
    tre país i que ens ha d’avergonyir a tots. I si alguna cosa posa de manifest aquest 
    show
    és que així no anem enlloc. El lamentable espectacle que estan oferint des que van ar
    -
    ribar al Govern, però que aquests dies està donant els millors números, posa en relleu 
    dues coses: en primer lloc, la seva incapacitat per oferir un govern estable i eficaç que 
    Catalunya necessita; però, sobretot, la falta de respecte a la ciutadania del nostre país.
    Senyor president, vostè creu, sincerament, que està en condicions de seguir go
    -
    vernant Catalunya? Vostès es van comprometre, en la campanya electoral, a coses 
    que no estaven en les seves mans, i per això el seu discurs no té gaire relació amb la 
    realitat. I és per això que estem en aquest carreró sense sortida. La desobediència, 
    tenim clar que ens porta al desastre; ho hem vist, ho vam veure la passada legislatu
    -
    ra. I ens alegrem que Esquerra Republicana hagi posat seny i, igual que s’ha substi
    -
    tuït al diputat Junqueras i al diputat Romeva, avui no es deixi que Junts per Catalu
    -
    nya desobeeixi el Tribunal Suprem.
    El seu Govern està profundament dividit. I vostè, senyor Torra, haurà de deci
    -
    dir: o democràcia o desobediència, no hi ha una altra opció. I si mai n’hi va haver, 
    la confiança entre vostès, tenim la sensació que està molt, molt tocada. Perquè s’han 
    enganyat entre vostès, perquè s’han parat trampes entre vostès i ens volien enganyar 
    a tots. Però jo crec que això, a partir d’avui ja no cola, president. Es fa difícil pensar 
    que en aquestes condicions seran, vostès, capaços de seguir governant. El president 
    de l’ultimàtum sembla que té un govern a les últimes.
    Seria fàcil donar per acabada la legislatura, però això està a les seves mans, així 
    com, també, la capacitat d’oferir estabilitat a un govern que fa aigües pertot arreu 
    –està a les seves mans, president. No fa ni un any que vam votar, i, tot i tenir una 
    majoria parlamentària, que no és una majoria social, tenen vostès l’obligació de diri
    -
    gir la Generalitat. I avui ens preguntem si vostès seran capaços de fer-ho, perquè, de 
    moment, tenim clar que no.
    L’hi hem proposat, i el Parlament va aprovar el mes de juliol, que convoqui les 
    forces parlamentàries per establir un diàleg entre les forces catalanes –i vostè encara 
    no ho ha fet– sobre el futur. Avui l’emplacem a que ho faci per parlar del present im
    -
    mediat, perquè és evident que el seu Govern fa aigües, i així no anem enlloc.
    Catalunya es mereix un govern estable i eficaç. I avui aquest govern no el té. Per 
    moltes fotos que es facin el senyor Torra i el senyor Aragonès, la votació d’avui a la 
    Mesa certifica que només poden seguir un camí, el del respecte; el del respecte a 
    les nostres lleis, als tribunals; però, sobretot, a la ciutadania, que veu avergonyida 
    aquest lamentable espectacle.
    Les coses han anat tan malament en aquest debat que l’aprovació d’unes o altres 
    resolucions està totalment mancada de credibilitat. Però el Grup Socialistes i Units 
    per Avançar ens prenem seriosament la nostra tasca, la nostra responsabilitat. Hem 
    vingut a aquest Parlament a fer el possible per tenir una legislatura profitosa per a 
    la ciutadania fent la nostra tasca, que és la d’oposició, mentre tenim un govern ir
    -
    responsable, que posa per sobre els seus interessos davant de tot, que tanca i obre el 
    Parlament a discreció, i que no governa, tot i que no tenen cap credibilitat i que ens 
    diu que la legislatura acabarà quan hi hagi una sentència, tot i això, el meu grup, de 
    manera responsable, ha negociat, i hem negociat tot el que hem pogut amb els grups 
    que han tingut disposició a fer-ho, per avançar l’acció de polítiques concretes benefi
    -
    cioses per al conjunt de la ciutadania. I hem transaccionat –hem transaccionat– amb els grups que donen suport al Go
-
    vern en matèria d’agricultura i en matèria de transició energètica.
    Pel que fa a transició energètica, i tenint en compte l’informe que van presentar 
    ahir el 
    Panel
    de científics de Nacions Unides sobre el canvi climàtic, hem fet una 
    transacció amb el Govern sobre la proposta de transició energètica, per impulsar les 
    energies renovables i l’eficiència energètica. No pot ser, no és de rebut, que el darrer 
    any, a Catalunya no s’hagi instal·lat ni un megawatt renovable.
    I també hem transaccionat amb el Govern sobre agricultura i món rural, unes po
    -
    lítiques que els independentistes han abandonat i que han patit retallades del 40 per 
    cent en l’àmbit agrícola i del 80 per cent en inversions. Bé. Doncs nosaltres els de
    -
    manem que tornin a prioritzar actuacions per fer front a la crisi de preus que hi ha en 
    els productes agrícoles, que escanya els petits productors, i també per situar el repte 
    de la despoblació i l’empobriment al món rural a l’agenda del Govern.
    També volem destacar algunes de les nostres propostes que esperem que tinguin 
    el suport i que siguin aprovades. En primer lloc, les que tenen a veure amb funció 
    pública. Conseller, amb tuïts –amb tuïts– no se solucionen els problemes. Esperem 
    que s’aprovi i que el Govern compleixi les seves obligacions, que retorni el que els 
    treballadors públics de la resta d’Espanya ja han recuperat. És hora de compensar 
    el seu esforç durant la crisi, i això vol dir el retorn de les pagues extraordinàries del 
    2013 i el 2014, assegurant que la del 2013 es faci el 2019 i la del 14, el 20.
    També esperem que es tirin endavant i que s’aprovin propostes del Grup Socia
    -
    lista sobre educació, universitats i cultures. Que, d’una vegada per totes, es posi en 
    marxa el Decret d’escola inclusiva, que fa molt de temps que estem esperant, perquè 
    els nens que tenen especials dificultats puguin tirar endavant la seva educació. I, so
    -
    bretot, han hagut de retirar la seva proposta de zero-tres. Nosaltres no volem poesia, 
    volem partides pressupostàries. I, per això, esperem que avui s’aprovi, d’una vega
    -
    da per totes, el finançament de 1.600 euros per plaça i any, i que es comprometin, 
    també, a arribar als 1.800, igual que volem que els tornin els diners als ajuntaments.
    De la mateixa manera, en qüestió de formació professional, i també en universi
    -
    tats; universitats, d’una vegada per totes, volem que es rebaixi aquest 30 per cent les 
    taxes universitàries, que s’equipari el preu dels màsters amb els graus, i, d’una vega
    -
    da per totes, les universitats públiques tinguin el que necessiten, que és un pla d’in
    -
    versions universitàries per als propers anys.
    Ens passa el mateix amb cultura. I esperem que també s’aprovi, que aquesta ri
    -
    dícula inversió en cultura que fa aquest Govern del 0,7 per cent del pressupost passi 
    a l’1, 5.
    Hi ha altres resolucions que també volem destacar ràpidament: el món local. Els 
    han deixat sols. Necessitem que els tornin la confiança i que hi hagi les inversions 
    que toca.
    Ens passa el mateix amb l’habitatge: necessitem col·laboració entre les diferents 
    administracions.
    I, pel que fa als serveis públics, també: mentre es discuteixen les llistes d’espera, 
    les llistes d’espera continuen creixent. I el mateix ens passa amb l’atenció a la depen
    -
    dència i amb serveis socials.
    Tenim altres propostes, i que esperem que també prosperin: d’inspecció laboral, 
    contra la violència masclista, per la infància, sobre turisme, sobre molts temes. Però, 
    també, amb el temps que em queda vull dedicar uns minuts al tema, no?, perquè 
    sembla que tot això de les polítiques sectorials i les necessitats dels catalans no és 
    important i que els titulars aniran del tema.
    Nosaltres ho fem molt fàcil: respectin les lleis, promoguin la convivència, pro
    -
    moguin el diàleg entre governs. Hi ha acords beneficiosos entre governs que és pos
    -
    sible que ens beneficiïn a tots, continuïn insistint en això. 
    Però, lamentablement, sembla que això va per una altra banda. Estem al 2018-
    2019, capítol del procés. Després del rotund fracàs de la via unilateral, després d’in
    -tentar separar Catalunya de la resta d’Espanya, després de mentir abans, durant i 
després de la campanya electoral –en aquesta «tardor calenta» que deia el president, 
    i que sembla que calenta és per uns més que per a uns altres–, el que tornen a de
    -
    manar –«amb fermesa», diuen– és un referèndum. Qui l’hi anava a dir, eh?, senyor 
    Torra..., aquell tuït, eh?, que deia que el referèndum pactat era com la llegenda del 
    peix Nicolau, i ara demanant un referèndum, quines coses! I Esquerra Republica
    -
    na, 
    donde dije «digo», digo «Diego»
    . No sé quantes vegades han votat i ara tornen 
    a demanar-ho. I els Comuns, també. Els Comuns acompanyant la burgesia en una 
    demanda que és evident que seria una gran estafa per a les persones comunes que 
    diuen defensar. 
    Bé. Doncs aquesta és l’estratègia, eh? Aquesta és la constatació de la falta d’es
    -
    tratègia. I ja els ho dic: en això no hi ha acord possible. Els referèndums per la inde
    -
    pendència són armes de divisió massiva; estan impulsats per nacionalistes que, des 
    de petits, no ens acaben de reconèixer a molts conciutadans com a iguals. I els que 
    diuen que han d’eixamplar la base ho fan amb falses promeses de beneficis econò
    -
    mics.
    Escolti’m bé: el responsable de la campanya del Brexit va dir que sense la men
    -
    tida aquella de l’autobús, eh?, dels 350 milions de lliures que marxaven cada setma
    -
    na, no haguessin guanyat el Brexit. Doncs bé, aquesta promesa dels 16.000 milions 
    en renda 
    per capita
    representa set vegades més. La seva mentida és set vegades més 
    gran que la que es va plantejar en el Brexit.
    Els socialistes anem en sentit contrari, i no és per raons legals, eh? Nosaltres es
    -
    tem convençuts que el millor per als catalans és tenir una bona integració espanyola 
    i europea. Vostès volen fer de Catalunya un paradís fiscal fora de la Unió Europea. 
    Nosaltres el que volem és integrar-nos cada cop més amb Espanya i amb Europa. 
    Així que votarem en contra de totes i cadascuna de les resolucions, de manera 
    cristal·lina, que tinguin a veure amb alguna cosa del que acabo d’exposar. Igual que 
    votarem en contra de totes les resolucions que parlen d’aquesta suposada causa ge
    -
    neral repressiva contra l’independentisme.
    Quan vostès fan i desfan en els mitjans públics, quan colonitzen carrers, quan 
    l’Administració no defensa l’interès general, quan els polítics entren en l’operativa 
    dels Mossos, quan estan sent investigats per utilitzar les dades de tots per al referèn
    -
    dum il·legal i quan obren i tanquen el Parlament a discreció no ens vinguin, a sobre, 
    a dir que ens persegueixen. 
    (Sona el senyal acústic que indica que s’ha exhaurit el 
    temps d’intervenció.)
    Ajudi’ns a canviar Espanya, a millora-la, a fer-la més inclusiva, 
    a millorar el que ens va deixar el Partit Popular......i deixin de demanar impossibles.
Gràcies.")

nuet_i_pujals <-
  c("Gràcies, president. Diputades, diputats, vull dedicar les primeres paraules de la 
meva intervenció a la situació d’excepcionalitat amb la que acudim en aquest Ple. 
Crec  que  és  imprescindible  clarificar  la  postura  del  nostre  grup  parlamentari.  Fa  
temps que el nostre grup parlamentari afirma que el soroll i la gesticulació per la 
gesticulació no serveixen de res, en cap dels sentits que en aquesta cambra això mas
-
sa sovint es manifesta per part de diferents grups parlamentaris. Fa pocs dies el company Oriol Junqueras expressava, des de dins dels murs de la 
presó de Lledoners, les mateixes inquietuds en un programa de televisió espanyola 
    Informe Semanal
    . Sembla que s’hagi perdut aquella doctrina tan repetida pel presi
    -
    dent Tarradellas de que l’únic que no es pot fer en política és el ridícul. I intentant 
    fer  que  el  Parlament  de  Catalunya  faci  el  ridícul  no  avancem,  retrocedim;  inten
    -
    tant fer que el Parlament de Catalunya faci el ridícul llencem pedres contra la teula
    -
    da de Catalunya, que és la nostra teulada. 
    Diputats i diputades de Junts per Catalunya, em refereixo molt directament a tots 
    vosaltres, rectifiqueu. Rectifiqueu i accediu a designar substituts dels quatre diputats 
    que no perdran pas les seves actes, ja ho sabeu. Ho diem des de la legitimitat que 
    ens atorga haver votat favorablement aquesta designació, també en som propietaris 
    d’aquest acord del Parlament. Per tant, us demanem, jo diria quasi que us exigim, 
    que no poseu en perill el conjunt del Parlament de Catalunya, compliu amb l’acord 
    del 2 d’octubre, que també vosaltres vau votar igual que nosaltres.
    Passo, concretament, a parlar de les propostes de resolució, perquè un flac favor 
    faríem si com han fet altres grups parlamentaris ens quedéssim amb el 
    lío
    i no par
    -
    léssim dels problemes de la gent. Aquest Ple de política general arriba amb una si
    -
    tuació d’excepcionalitat democràtica. Això és evident. I cal recordar-ho dia sí i dia 
    també. Arriba en un moment en què tenim presó i presos i preses polítiques, i per
    -
    sones a fora de Catalunya que s’enfronten a penes de presó de fins a trenta anys. 
    Des de Catalunya en Comú Podem creiem que Catalunya necessita avançar i 
    ho ha de fer en tots els àmbits. El país ha d’avançar i obrir una nova etapa en ma
    -
    tèria nacional, en la recerca de grans consensos que ens fan forts com a país i com 
    a societat; necessita avançar en matèria social després d’una dècada fosca en què 
    va començar el 2008 amb les pitjors retallades socials ordenades al servei de l’aus
    -
    teritat. 
    I, en tercer lloc, creiem que el país necessita avançar, també, en la protecció dels 
    drets de les persones i del territori. Actuar de forma decidida, prioritària i urgent 
    contra les violències masclistes. Ha d’esdevenir, avui i aquí, una prioritat de país, 
    amb més recursos i més atenció per part de les administracions. Sis dones han estat 
    assassinades aquest any a Catalunya.
    Em vull referir a dos propostes de resolució que presentem sobre l’eix nacional. 
    La primera sobre un model de relació bilateral entre Catalunya i l’Estat. És evident 
    que la nova relació de bilateralitat entre l’Estat i la Generalitat és una bona notícia 
    per a tots els catalans i catalanes perquè obre un període de diàleg institucional i de 
    distensió, però, no n’hi ha prou. Cal que aquesta nova etapa assumeixi els diagnòs
    -
    tics compartits per grans majories socials a Catalunya que són: que el model auto
    -
    nòmic està esgotat als ulls d’una gran majoria de catalans i catalanes; que cal assolir 
    un nou estatus polític per Catalunya, que respongui al desig de més sobirania, i que 
    el diàleg amb l’Estat sigui condició de possibilitat de més avenços democràtics. La 
    bilateralitat s’ha de basar sí o sí en el principi d’igualtat institucional. 
    I una altra n’hem presentat de resolució: sobre el pacte de claredat. Ho hem dit 
    sempre: Catalunya ha de poder decidir el seu futur, però per això cal un acord polí
    -
    tic, social i nacional; un acord fruit d’un diàleg a Catalunya.
    Cal  que  la  política  catalana  sigui  clara,  tingui  un  rumb  i  una  agenda  política.  
    Els intents a correcuita per generar nous marcs plebiscitaris, com l’ultimàtum que 
    el president Torra ens va fer en el seu discurs d’investidura, ens fan menys i ens fan 
    més dèbils.
    El pacte de claredat ens ha de servir per debatre com seria legítim per al conjunt 
    de catalans i catalanes –ho repeteixo, legítim per al conjunt de catalans i catalanes, 
    i no sols una part del país– la realització d’un referèndum sobre el futur polític de 
    Catalunya. Massa sovint tenim debats nacionals que de forma incomprensible eviten 
    tractar el model de país que volem i, encara més, eviten parlar sobre el com. Doncs 
    nosaltres fem una proposta sobre el què i sobre el com. El pacte de claredat ha de ser una eina de construcció nacional amb una orienta
-
    ció estratègica; sí, estratègia, això que tant trobem a faltar en el Govern del president 
    Torra. Estratègia per acordar amb èxit el que proposem en aquesta proposta de re
    -
    solució, que no és ni més ni menys que la celebració d’un referèndum sobre el futur 
    polític de Catalunya i un acord entre l’àmplia majoria de forces polítiques i socials 
    per tenir acordat un procediment, una pregunta, unes condicions de realització i una 
    interpretació del resultat.
    Sí, senyora Eva Granados, ens acompanyem potser a vegades de persones que 
    vostè no entén, però agrairia que vostè i el seu grup parlamentari es deixés d’acom
    -
    panyar del bloc del 155 a l’hora de fer propostes de futur per a Catalunya. 
    (Aplaudi
    -
    ments.)
    Perquè ni amb Ciutadans ni amb el Partit Popular trobarem, companya soci
    -
    alista, les solucions que Catalunya necessita.
    Dir que votarem a favor de la proposta de Junts per Catalunya i d’Esquerra Re
    -
    publicana de referèndum acordat i vinculant, perquè la proposta en si mateixa ja és 
    una esmena a la proposta d’ultimàtum que el president Torra va oferir en el debat 
    d’investidura. I, evidentment, nosaltres sempre hem estat aquí, com ens agradaria 
    que tots els sobiranistes poguessin votar a favor del pacte de claredat que oferim. 
    Quina por fa pactar a Catalunya un referèndum fet a Catalunya i des de Catalunya? 
    O no està prou clar, això? Per tant, evidentment, nosaltres donarem suport a aquesta 
    proposta.
    Per això, dir que proposem un conjunt també de propostes de resolució per po
    -
    sar fil a l’agulla, com són, evidentment, fomentar el treball autònom en condicions 
    dignes; m’estic referint a un bloc de polítiques socials que defineixen per nosaltres la 
    Catalunya que volem i la Catalunya que somiem.
    Defensar la universitat pública per fer complir els acords del Parlament en matè
    -
    ria de taxes.
    Començar també a parlar del territori, per exemple de la Costa Brava, que es tro
    -
    ba ara sota l’amenaça de l’especulació urbanística. Asseure’s amb la plataforma SOS 
    Costa Brava i modificar el Pla director urbanístic del sistema costaner.
    Solucionar el problema evident de la seguretat pública. Cal una reprovació del 
    conseller Buch; cal una reprovació, i per això votarem a favor de la proposta de re
    -
    solució que han presentat els companys de la CUP. Nosaltres defensem una visió 
    crítica més ampla, no només pels desastrosos operatius del 29 de setembre i de l’1 
    d’octubre, però s’acumulen massa queixes en el territori, massa alcaldes i alcaldes
    -
    ses emprenyats i emprenyades, de tots els colors polítics; els sindicats policials estan 
    que trinen, i tota l’oposició li demana al conseller que rectifiqui. Conseller, escolti i 
    rectifiqui. Acabo, ja finalment, només per citar breument que, evidentment, hem de parlar 
sobre el tema de la violència masclista –abans m’hi he referit–, i necessitem, més 
que una declaració d’un pla, pressupostos, pressupostos i pressupostos. Cal parlar de 
l’escola pública, de les guarderies, de la situació precària de la sanitat pública de Ca
-
talunya, perquè ens importa... ...i  ens  interessa.  I,  finalment,  cal  parlar  de  que  la  gent  necessita  llum,  aigua,  
electricitat i calefacció. És la gent més necessitada, i són les preguntes que aquest 
debat de política general... ")

sanchez_dipp2 <- 
  c("Bé, bona tarda. Tenim poc temps; per tant, aniré al gra. Els Països Catalans vi
-
    vim una important regressió de drets polítics, socials, econòmics, culturals i eco
    -
    lògics. I, sobre aquesta senzilla però greu anàlisi, hem plantejat les propostes de la 
    CUP - Crida Constituent.
    Amb  les  nostres  propostes  volem  tornar  a  reivindicar  el  dret  d’aquest  poble  a  
    exercir la seva autodeterminació, que és el dret mare de tota la resta de drets asse
    -
    nyalats. Aquests dies tenim més present que mai la presidenta Carme Forcadell, que 
    va presidir l’últim debat de política general i que avui es troba injustament empreso
    -
    nada per permetre tots els debats.
    També volem tornar a dir avui, 9 d’octubre, Diada Nacional del País Valencià, que 
    som Països Catalans. Cantava Al Tall, en aquella mítica cançó, que «no s’ensenya 
    en les escoles com van esclafar un país, perquè d’aquella sembrada continuen collint 
    fruits». Aquesta frase ens recorda la importància de no oblidar com ens han esquar
    -
    terat el país, de com el règim, a cops d’amnèsia col·lectiva, va intentar silenciar i es
    -
    borrar una història que també és nostra, una diada que també és nostra. Per Ovidi, per 
    Fuster i Estellés, per Guillem, per les Tereses anònimes, per l’escola valenciana, per la 
    Punta i el Cabanyal, per les víctimes del metro de València, pels bombers forestals 
    que porten vint-i-sis dies de vaga i per la lluita antifeixista, som Països Catalans.
    I tant al País Valencià com aquí cal posar sobre la taula la qüestió central, que és 
    en el que hem intentat centrar les nostres propostes de resolució: els límits de l’auto
    -
    nomisme com a eina per a la transformació social. En el marc de la sagrada Consti
    -
    tució espanyola no hi ha transformació social realista, no hi ha ruptura possible. No 
    hem après res, de l’1 d’octubre? L’1 d’octubre va demostrar que la confluència de la 
    força de la gent, amb la implicació de les institucions, pot superar qualsevol barrera. 
    No és que la CUP ho sàpiga; molt probablement vostès, Govern, també ho saben, i 
    potser els fa basarda. Es tracta de tornar a posar en funcionament el poder popular 
    més potent que hem viscut, i això consisteix en desestructurar totes les relacions de 
    poder entre Catalunya i l’Estat. Mentre continuïn pensant en la lògica del vell món, 
    no podrem sortir d’aquest bloqueig desconcertant.
    El nou ordre cultural que sorgeixi de la ruptura amb el règim del 78 no es mate
    -
    rialitzarà per art de màgia. Pensen que poden transformar el país que coneixem apli
    -
    cant les mateixes polítiques que han aplicat durant dècades? Nosaltres pensem que 
    no. El senyor Torra ens demanava unitat l’altre dia, ens demanava que, si no estàvem 
    units, no ens en sortiríem. Nosaltres li diem que, si no posen aquest Govern a treba
    -
    llar pel seu poble, el seu poble no se’n sortirà i no l’hi perdonarà mai.
    A dia d’avui el poble de Catalunya té molts problemes per arribar a final de mes, 
    el poble de Catalunya no té garantit el sostre, Catalunya lidera el nombre més alt de 
    desnonaments de tot l’Estat. Què pensen fer? Nosaltres pensem que de forma imme
    -
    diata cal expropiar els habitatges buits en mans dels bancs. S’imaginen ser capaços 
    de teixir una aliança institucional i popular al nivell de l’1 d’octubre per garantir el 
    sostre per a tothom? Nosaltres sí que ens ho imaginem, i és aquesta, la nostra pro
    -
    posta política.
    L’1  d’octubre  demostra  també  que  un  dels  principals  obstacles  són  i  seran  les  
    grans empreses de l’IBEX 35, que estan tan ben representades en aquesta cambra, 
    xantatges dels quals aquests dies hem conegut les maniobres de la claveguera. No 
    ho veuen, que sense una banca pública, cooperativa, social i ecològica no hi haurà 
    república possible?
    I després que la ciutadania hagi plantat cara al gàngster banquer, a Rodrigo Rato, 
    també proposem que cal seguir mobilitzades contra les que s’enriqueixen a costa de la nostra misèria. I per això la CUP som acusació particular en el judici que co
-
    mençava la setmana passada pels sous de Caixa Catalunya. Per cert, alguns partits 
    d’aquesta cambra, tots els que seien al consell d’administració llavors, deuen expli
    -
    cacions a tota la societat. Oi, senyor Iceta? Un forat impune de 12 milions d’euros. 
    Nosaltres, com ja s’ha dit, també ens hem vist obligades a presentar una propos
    -
    ta de resolució pel dret a protesta i dissidència política, perquè a dia d’avui no està 
    garantida, i no només per culpa de l’Estat espanyol, perquè el senyor Buch i els seus 
    Mossos d’Esquadra el que fan és reprimir la dissidència política constantment. No
    -
    saltres els diem que parin de pegar la gent, que parin de desnonar famílies i que pa
    -
    rin d’alimentar els relats dels Aznars. Trenquin amb les velles lògiques del poder, o 
    no hi haurà república possible.
    Avui que l’exigència democràtica torna a ser subversiva, els volem fer una pre
    -
    gunta tant a Esquerra Republicana com a Junts per Catalunya, i també als comuns: 
    entre salvar les velles lògiques del poder, salvar les velles lògiques del capitalisme, 
    salvar les velles lògiques que vostès mateixos van consolidar a través del pacte, o sal
    -
    var la democràcia, vostès què trien? Nosaltres, volem crear un, dos, tres 1 d’octubre 
    als Països Catalans i arreu de l’Estat espanyol, com a forma per ampliar drets.
    Moltes gràcies.")

simplify_text <- function(x){
  x <- gsub("[\r\n]", "", x)
  x <- str_replace(gsub("\\s+", " ", str_trim(x)), "B", "b")
  return(x)
}

clean_text <- function(x){
  x <- simplify_text(x)
  x <- str_replace_all(x, "[[:punct:]]", " ")
  x <- tolower(x)
  return(x)
}

make_word_vector <- function(x){
  x <- clean_text(x)
  x_parsed <- strsplit(x, " ")
  x <- unlist(x_parsed)
}

make_word_df <- function(x){
  x <- make_word_vector(x)
  x <- data_frame(word = x)
  x <- x %>% group_by(word) %>% summarise(freq = n()) %>% arrange(desc(freq)) %>%
    mutate(cs = cumsum(freq)) %>%
    mutate(p = freq / sum(freq)) %>%
    mutate(psc = cs / sum(freq)) %>%
    filter(! word %in% c('', '\n'))
  # Calculate type token ratio
  # (types = total number of DIFFERENT words)
  # (tokens = total number of words)
  return(x)
}



# Article on lexical diversity: https://core.ac.uk/download/pdf/82620241.pdf


corpus_x <- corpus(simplify_text(combined_df$txt),
                   docnames = combined_df$person)
docvars(corpus_x, 'Person') <- combined_df$person
summary(corpus_x)
# texts(corpus_x)[1]
## Quick search
# kwic(corpus_x, "comandos")
# head(docvars(corpus_x))
## Extract tokens
# tokens(corpus_x, remove_numbers = TRUE,  remove_punct = TRUE)
## Document feature matrix

# Remove stopwords
catalan_spanish_stopwords <- 
  c(
    readLines('stopwords/stopwords-ca.txt'),
    readLines('stopwords/stopwords-es.txt')
  )
my_dfm <- dfm(corpus_x,
              remove_punct = TRUE,
              remove = catalan_spanish_stopwords)
## See top 20 words
topfeatures(my_dfm, 20)
## Wordcloud
cols <- c(databrew::make_colors(n = 8)[c(1:6,8)], 'darkred')
textplot_wordcloud(my_dfm, min_count = 1, random_order = FALSE,
                   rotation = 0,#0.25, 
                   min_size = 0.35,
                   max_size = 1.5,
                   max_words = 5000,
                   # labelcolor = cols,
                   # labeloffset = 1,
                   labelsize = 2.5,
                   color = cols,
                   comparison = TRUE)
# Lexical diversity
ld <- textstat_lexdiv(my_dfm,
                      measure = c('R', 'S'),
                      # measure = c("all"),
                      log.base = 10) %>%
  mutate(person = combined_names) %>%
  gather(key, value, R:S) %>%
  # gather(key, value, TTR:lgeV0) %>%
  # gather(key, value, R:R) %>%
  filter(!person %in% c('Haley', 'Obama', 'Trump'))
ggplot(data = ld,
       aes(x = person,
           y = value)) +
  geom_bar(stat = 'identity',
           position = position_dodge(width = 0.8)) +
  geom_text(size = 3,
            aes(label = round(value, digits = 3))) +
  facet_wrap(~key,
             scales= 'free_y') +
  theme(axis.text.x = element_text(angle = 90,
                                   vjust = 0.5,
                                   hjust = 1))
