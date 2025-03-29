// Created from Deep Research

// STEP 1: Clear the database (optional)
MATCH (n) DETACH DELETE n;

// STEP 2: Create the Putin node (serving as the central reference point)
CREATE (putin:Person {
  name: "Vladimir Putin",
  title: "President of Russia"
});

// STEP 3: Create all Person nodes

// Nikolai Patrushev
CREATE (patrushev:Person {
  name: "Nikolai Patrushev",
  title: "Secretary of the Security Council of Russia (2008–2024)",
  affiliations: "Security Council of Russia; Federal Security Service (FSB)",
  career_history: "Career KGB officer; Director of the FSB (1999–2008); Secretary of the Russian Security Council from 2008 until 2024",
  personality_traits: "Ultra-hawkish and conspiratorial, often described as a 'hawk's hawk' with a deep-seated belief that the West seeks to destroy Russia. Known as the ideologue of Kremlin anti-Americanism.",
  public_statements: "Famously claimed that the United States 'would much rather that Russia did not exist at all as a country'. Has framed the Ukraine war as a defensive 'holy war' against the West in his writings.",
  relationship_to_putin: "Longtime confidant; worked with Putin in the Leningrad KGB in the 1970s and succeeded him as FSB director in 1999. Essentially Putin's national security adviser.",
  trust_level: "Extremely high – widely regarded as one of Putin's most trusted and influential advisors, wielding major influence over security and foreign policy decisions.",
  notable_incidents: "Accused of approving operations like the 2006 poisoning of ex-spy Alexander Litvinenko. Allegedly involved in the 2016 Montenegro coup attempt. Reported by media as a key architect behind hardline policies and possibly behind the alleged assassination of Wagner chief Yevgeny Prigozhin in 2023.",
  description: "Nikolai Patrushev serves as Secretary of the Security Council of Russia (2008–2024). A career KGB officer and former FSB director (1999–2008), he is known for his ultra-hawkish, anti-Western stance. Patrushev is one of Putin's oldest confidants from the Leningrad KGB days. He plays a major role in shaping security and foreign policy, and is widely considered a top ideologue of Kremlin anti-Americanism."
});

// Alexander Bortnikov
CREATE (bortnikov:Person {
  name: "Alexander Bortnikov",
  title: "Director of the Federal Security Service (FSB)",
  affiliations: "Federal Security Service (FSB); Security Council of Russia",
  career_history: "Career KGB/FSB officer. Served in the Leningrad KGB in the 1970s; rose through the ranks of the FSB. Appointed Director of the FSB in 2008.",
  personality_traits: "Repressive and secretive. Maintains an iron grip on Russian internal security, overseeing surveillance and crackdowns. A steadfast enforcer rather than an outspoken policy influencer.",
  public_statements: "Rarely speaks publicly. Known for feeding Putin daily intelligence that reinforces a siege mentality. Implicated in operations against opposition figures like Alexei Navalny.",
  relationship_to_putin: "Long-time associate since 1970s Leningrad KGB. Trusted to oversee domestic security. Has less personal influence on Putin's strategic decisions compared to Patrushev or Naryshkin.",
  trust_level: "High in security matters – Putin entrusts him with the country's most powerful domestic agency.",
  notable_incidents: "Oversaw the detention of protesters and opposition activists. The FSB under his watch was exposed as responsible for Navalny's 2020 poisoning. Son Denis Bortnikov was sanctioned for benefiting from his father's position.",
  description: "Alexander Bortnikov is Director of the FSB, having served in the KGB since the 1970s. Known for a repressive internal security stance, he rarely appears publicly but is a loyal enforcer for Putin, feeding him daily intelligence. While personally trusted, he is less influential on broader strategy than some other siloviki."
});

// Sergei Naryshkin
CREATE (naryshkin:Person {
  name: "Sergei Naryshkin",
  title: "Director of the Foreign Intelligence Service (SVR)",
  affiliations: "Foreign Intelligence Service (SVR); Presidential Administration; State Duma",
  career_history: "Former KGB officer. Held senior roles under Putin, including Deputy PM for economic development, Chairman of the State Duma (2011–2016). Appointed SVR Director in 2016.",
  personality_traits: "Loyal, conservative, and bureaucratic in style. Publicly hardline, indulging in conspiratorial rhetoric.",
  public_statements: "Has claimed that Navalny's poisoning was a Western 'sacrificial victim' plot. Infamously hesitated on live TV in 2022 when endorsing recognition of Ukraine's breakaway regions.",
  relationship_to_putin: "Known Putin since the early 1990s in St. Petersburg. Loyal subordinate in various capacities.",
  trust_level: "High – a trusted loyalist, though not necessarily central in Putin's innermost strategic circle.",
  notable_incidents: "Putin publicly humiliated him in February 2022 for wavering on Ukraine policy. Still retained as SVR chief, signifying ongoing trust.",
  description: "Sergei Naryshkin directs the SVR and is a longtime Putin ally from KGB/St. Petersburg days. Known for loyal service in top government roles and conspiracy-laden rhetoric, he remains a key but somewhat less publicly influential figure in Putin's circle."
});

// Sergei Shoigu
CREATE (shoigu:Person {
  name: "Sergei Shoigu",
  title: "Minister of Defense of Russia (2012–2024)",
  affiliations: "Ministry of Defense; Security Council; Ministry of Emergency Situations (EMERCOM)",
  career_history: "Minister of Emergency Situations (1991–2012), brief Governor of Moscow Oblast (2012), then Minister of Defense (2012–2024). Key figure in 2014 Crimea annexation and Syrian intervention.",
  personality_traits: "Loyal and pragmatic. Known for his outdoorsman image with Putin, less ideologically anti-Western than other siloviki.",
  public_statements: "Generally sticks to the Kremlin line on military matters, praising the troops and announcing operations.",
  relationship_to_putin: "Close personal ally. They share a friendship beyond official roles, often vacationing together in Siberia.",
  trust_level: "Very high, though tested by war difficulties. Remained Defense Minister throughout the Ukraine war despite setbacks, then moved to Secretary of the Security Council in 2024.",
  notable_incidents: "Oversaw the 2014 Crimea operation, 2015 intervention in Syria, and faced criticism during the 2022-23 Ukraine conflict. Targeted by Yevgeny Prigozhin's criticisms prior to the Wagner mutiny.",
  description: "Sergei Shoigu served as Defense Minister (2012–2024), previously leading EMERCOM. Known for pragmatic loyalty and a personal bond with Putin, he oversaw major military operations including Crimea’s annexation and intervention in Syria. Despite challenges in Ukraine, Shoigu maintained Putin’s trust and transitioned to a Security Council role."
});

// Valery Gerasimov
CREATE (gerasimov:Person {
  name: "Valery Gerasimov",
  title: "Chief of the General Staff of the Russian Armed Forces",
  affiliations: "Russian Armed Forces; General Staff; Ministry of Defense",
  career_history: "Career army officer, fought in Chechnya, became Chief of the General Staff in 2012. Oversees operational planning, including the 2022 Ukraine invasion.",
  personality_traits: "Hardline, 'old-school' Soviet general, low-key in public. Loyal and disciplined.",
  public_statements: "Rarely makes public political statements. Known for a 2013 article on modern warfare (the so-called 'Gerasimov doctrine').",
  relationship_to_putin: "Not originally in Putin's personal circle but gained trust through his military career. Key advisor on war and defense.",
  trust_level: "High in military terms. Despite setbacks in Ukraine, Putin kept him as Chief of General Staff and even put him in direct charge of the war effort in 2023.",
  notable_incidents: "Criticized for the failed initial invasion of Ukraine. Remained in position while other generals were demoted or replaced. Target of Wagner's Prigozhin but stayed loyal to Putin.",
  description: "Valery Gerasimov, Chief of the General Staff, is a career army officer known for disciplined service and shaping Russia’s modern warfare strategy. Despite criticism over Ukraine’s invasion setbacks, Putin has retained faith in Gerasimov’s loyalty and placed him in charge of key military operations."
});

// Dmitry Medvedev
CREATE (medvedev:Person {
  name: "Dmitry Medvedev",
  title: "Deputy Chairman of the Security Council; Former President of Russia",
  affiliations: "Security Council of Russia; United Russia party; Government of Russia",
  career_history: "Longtime Putin protégé from St. Petersburg. Served as President (2008–2012), then Prime Minister (2012–2020), now Deputy Chairman of the Security Council.",
  personality_traits: "Once seen as mild and Western-leaning, turned ultra-hawkish post-2022 with aggressive and bombastic rhetoric.",
  public_statements: "Known for extreme statements on social media, threatening nuclear escalation and vilifying the West.",
  relationship_to_putin: "Close associate for decades. Handpicked by Putin for presidency in 2008, then swapped roles in 2012. Continues to be a loyal surrogate.",
  trust_level: "High – entrusted with the presidency itself. Now used as a harsh public voice for Kremlin policy.",
  notable_incidents: "Oversaw a 'reset' with the West as president, but pivoted to hardline. Famously posts incendiary comments about Ukraine and NATO.",
  description: "Dmitry Medvedev, once portrayed as a liberal reformer, now serves as Putin’s outspoken hawk and Deputy Chairman of the Security Council. A longtime protégé, he was Russia’s President (2008–2012) before returning power to Putin. Known for threatening rhetoric in support of Kremlin policy."
});

// Mikhail Mishustin
CREATE (mishustin:Person {
  name: "Mikhail Mishustin",
  title: "Prime Minister of Russia",
  affiliations: "Government of Russia; Federal Tax Service",
  career_history: "Career economist, modernized Federal Tax Service (2010–2020). Appointed Prime Minister in January 2020.",
  personality_traits: "Technocratic, low-profile, efficient manager, with little personal ambition. Focused on economic governance.",
  public_statements: "Primarily addresses economic and administrative issues, avoids geopolitical rhetoric.",
  relationship_to_putin: "Not part of Putin’s old circle but respected for competence. Professional relationship with the president.",
  trust_level: "Moderately high – trusted to manage Russia's economy, but not a key security or foreign policy adviser.",
  notable_incidents: "Led the economic response to COVID-19 and sanctions, stabilizing the economy. Carefully avoids overshadowing Putin.",
  description: "Mikhail Mishustin is a technocrat who became Prime Minister in 2020 after directing the Federal Tax Service. Viewed as competent and focused on economic matters, he maintains a strictly professional relationship with Putin and stays out of high-profile political conflicts."
});

// Sergei Lavrov
CREATE (lavrov:Person {
  name: "Sergei Lavrov",
  title: "Minister of Foreign Affairs of Russia",
  affiliations: "Ministry of Foreign Affairs; United Nations (former Russian Ambassador)",
  career_history: "Career diplomat, served as Ambassador to the UN (1994–2004), then Foreign Minister from 2004 onward.",
  personality_traits: "Shrewd and combative, known for sharp rhetoric defending Russian interests.",
  public_statements: "Frequently castigates the West, frames Russia as under siege. Denies Western allegations and stands by Kremlin policies.",
  relationship_to_putin: "A loyal envoy, not a personal friend. Executes Putin's foreign policy directions reliably.",
  trust_level: "High in diplomatic matters. Functions as Putin's top foreign affairs spokesman and negotiator.",
  notable_incidents: "Face of Russia in major international crises, from Georgia in 2008 to Ukraine in 2022. Under sanctions by Western countries.",
  description: "Sergei Lavrov, one of the longest-serving foreign ministers, is known for his skilled yet confrontational style. A career diplomat, he reliably represents Putin’s foreign policy abroad, sharply criticizing Western positions and articulating the Kremlin’s stance on global issues."
});

// Viktor Zolotov
CREATE (zolotov:Person {
  name: "Viktor Zolotov",
  title: "Director of the National Guard of Russia (Rosgvardiya)",
  affiliations: "National Guard of Russia; Presidential Security Service (former)",
  career_history: "Former chief bodyguard to Putin, served in the KGB, then led Putin's personal security detail. Appointed head of National Guard in 2016.",
  personality_traits: "Fiercely loyal, blunt, prone to public bravado (e.g., challenging opposition leaders to fights). Represents Putin’s trusted muscle.",
  public_statements: "Famously threatened Alexei Navalny with a duel. Defends the use of force against regime critics.",
  relationship_to_putin: "Deep personal trust from longtime bodyguard days. Entrusted with command of internal troops.",
  trust_level: "Very high due to personal loyalty and security responsibilities.",
  notable_incidents: "Oversees crackdowns on protesters. Sanctioned by the West for human rights abuses related to the National Guard’s role.",
  description: "Viktor Zolotov, formerly Putin’s chief bodyguard, now leads the National Guard. Known for personal loyalty and aggressive rhetoric against critics, he wields extensive internal security power and remains firmly in Putin’s inner circle."
});

// Igor Sechin
CREATE (sechin:Person {
  name: "Igor Sechin",
  title: "CEO of Rosneft (state oil company)",
  affiliations: "Rosneft; Russian Presidential Administration; Government of Russia",
  career_history: "Ex-KGB associate of Putin. Served in the Kremlin administration in the early 2000s, then Deputy Prime Minister (2008–2012). CEO of Rosneft since 2012.",
  personality_traits: "Extremely influential, nicknamed 'Darth Vader' for his feared presence. Loyal and secretive, ultranationalist outlook.",
  public_statements: "Rarely speaks publicly. Emphasizes Russia's energy strength and strategic oil policies aligned with the Kremlin.",
  relationship_to_putin: "Among Putin's closest old allies from St. Petersburg/KGB days. Manages key assets on Putin's behalf.",
  trust_level: "Extremely high. Considered a core member of Putin's innermost circle.",
  notable_incidents: "Central in state takeovers of strategic energy assets (e.g., Yukos). Under Western sanctions as a close Putin associate.",
  description: "Igor Sechin, CEO of Rosneft and longtime Putin associate from KGB days, wields major influence over Russia’s energy sector. Often called “Darth Vader” for his power behind the scenes, he is deeply trusted by Putin to manage strategic oil assets and handle sensitive projects."
});

// Alexei Miller
CREATE (miller:Person {
  name: "Alexei Miller",
  title: "CEO of Gazprom",
  affiliations: "Gazprom; St. Petersburg City Administration (former)",
  career_history: "Economist from St. Petersburg, worked under Putin in the 1990s. Became CEO of Gazprom in 2001.",
  personality_traits: "Loyal, discreet technocrat. Efficient manager who aligns Gazprom's strategy with Kremlin policies.",
  public_statements: "Focused on energy policy, justifying gas supply cuts in line with Kremlin objectives.",
  relationship_to_putin: "An old subordinate from St. Petersburg. Personally loyal, controls Russia's most strategic gas company on Putin's behalf.",
  trust_level: "Very high in the economic sphere. Under Western sanctions for supporting the Russian government.",
  notable_incidents: "Oversaw major pipeline projects (e.g., Nord Stream), crucial for Putin's geopolitical leverage. Engaged in gas disputes with Ukraine and Europe.",
  description: "Alexei Miller has led Gazprom since 2001, rising from his time with Putin in St. Petersburg. Responsible for Russia’s vital natural gas sector, Miller remains one of Putin’s top economic enablers, ensuring Gazprom’s operations bolster the Kremlin’s strategies at home and abroad."
});

// Arkady Rotenberg
CREATE (arkadyRotenberg:Person {
  name: "Arkady Rotenberg",
  title: "Businessman (co-owner of SMP Bank; former owner of Stroygazmontazh)",
  affiliations: "SMP Bank; Stroygazmontazh (SGM) construction firm; Putin's judo club",
  career_history: "Childhood friend of Putin, judo sparring partner. Gained wealth via state construction contracts, including the Crimea bridge project.",
  personality_traits: "Largely quiet publicly, fiercely loyal, major beneficiary of Putin’s patronage system.",
  public_statements: "Rarely speaks; frames his businesses (like building the Crimea bridge) as patriotic service.",
  relationship_to_putin: "Very close personal friend from childhood. Trusted to handle major state projects and possibly to manage Putin's assets.",
  trust_level: "Extremely high at a personal level.",
  notable_incidents: "Sanctioned for his ties to Putin post-2014. Claimed ownership of 'Putin’s palace' to shield the president.",
  description: "Arkady Rotenberg, Putin’s longtime judo partner, is a billionaire contractor entrusted with significant state infrastructure projects (e.g., the Crimea bridge). His quiet yet loyal role has made him a central figure in Putin’s close circle, benefiting from lucrative contracts."
});

// Boris Rotenberg
CREATE (borisRotenberg:Person {
  name: "Boris Rotenberg",
  title: "Businessman (co-owner of SMP Bank)",
  affiliations: "SMP Bank; Stroygazmontazh (former co-owner); Putin's judo club",
  career_history: "Also a judo sparring partner of Putin and younger brother of Arkady Rotenberg. Co-owner of SMP Bank. Won state-favored deals post-2000.",
  personality_traits: "Media-shy, loyal, gains wealth through brotherly partnership and Putin’s patronage.",
  public_statements: "Virtually none. Denies wrongdoing amid sanctions, claiming to be just a private businessman.",
  relationship_to_putin: "Ties from judo days via brother Arkady, trusted within the close circle of 'Putin’s friends'.",
  trust_level: "High – personal friendship, though overshadowed by Arkady’s prominence.",
  notable_incidents: "Both Rotenbergs were sanctioned after 2014, accused of helping Putin’s financial circle. Profited from Sochi Olympic constructions.",
  description: "Boris Rotenberg is Arkady’s younger brother and a fellow judo associate of Putin. He co-owns SMP Bank and profited from major state contracts, reflecting the personal and financial loyalty he shares with Russia’s leadership."
});

// Gennady Timchenko
CREATE (timchenko:Person {
  name: "Gennady Timchenko",
  title: "Businessman (Volga Group owner; oil and gas trader)",
  affiliations: "Volga Group; Gunvor (co-founder); Novatek (shareholder)",
  career_history: "Soviet-trained engineer turned oil trader. Co-founded Gunvor, longtime acquaintance of Putin since the 1990s. Built a vast portfolio in energy and infrastructure.",
  personality_traits: "Discreet yet very powerful financially. Avoids public spotlight, unwaveringly loyal to Putin.",
  public_statements: "Dismisses claims he is Putin’s personal financier, attributing success to business acumen.",
  relationship_to_putin: "Close friend for decades, widely considered a key figure managing Putin’s financial interests.",
  trust_level: "Very high. Likely one of the oligarchs entrusted with safeguarding Putin’s wealth.",
  notable_incidents: "Sanctioned in 2014 for links to Putin. Sold Gunvor stake just before sanctions. Volga Group invests in Novatek and other strategic assets.",
  description: "Gennady Timchenko, an oil and gas magnate, is among Putin’s closest business allies. Known for discreet operations and major stakes in firms like Novatek, he is widely believed to manage or shield Putin-related wealth, reinforcing his status within the innermost circle."
});

// Yury Kovalchuk
CREATE (kovalchuk:Person {
  name: "Yury Kovalchuk",
  title: "Major Shareholder of Bank Rossiya",
  affiliations: "Bank Rossiya; National Media Group; Ozero Dacha Cooperative",
  career_history: "Co-founder and largest shareholder of Bank Rossiya, a key financial hub for Putin’s circle. Longtime friend of Putin, neighbors in a dacha cooperative in the 1990s.",
  personality_traits: "Influential behind the scenes, considered an intellectual influencer of Putin’s conservative ideology.",
  public_statements: "Rarely speaks publicly, though controlling significant media. Rumored to shape anti-Western narratives.",
  relationship_to_putin: "Close personal friend. Often referred to as Putin’s 'personal banker' and ideological ally.",
  trust_level: "Extremely high, entrusted with managing both financial and media aspects of the regime.",
  notable_incidents: "Bank Rossiya sanctioned in 2014 as the 'personal bank for Russian officials'. Expanded pro-Kremlin media ownership through National Media Group.",
  description: "Yury Kovalchuk, a key financial and ideological figure for Putin, owns Bank Rossiya and wields media influence via National Media Group. His closeness to Putin dates back to the 1990s, establishing him as a critical linchpin in Putin’s financial and propaganda infrastructure."
});

// Patriarch Kirill
CREATE (kirill:Person {
  name: "Patriarch Kirill (Vladimir Gundyayev)",
  title: "Patriarch of Moscow and All Rus' (Russian Orthodox Church)",
  affiliations: "Russian Orthodox Church; Moscow Patriarchate",
  career_history: "Lifelong clergyman, became Patriarch in 2009. Aligned the Church closely with the Kremlin under Putin.",
  personality_traits: "Ultraconservative, nationalist, sees political issues in moral-spiritual terms, deeply anti-Western.",
  public_statements: "Once called Putin's leadership 'a miracle of God'. Portrays Ukraine war as a righteous struggle against the West.",
  relationship_to_putin: "Allied but not socially close. They mutually benefit politically: Church endorsements help legitimize Putin.",
  trust_level: "High in ideological partnership, though not a direct political strategist.",
  notable_incidents: "Supports crackdowns on liberal values, sanctioned by some Western states for promoting war narratives.",
  description: "Patriarch Kirill leads the Russian Orthodox Church and is a staunch ally of the Kremlin. He backs Putin’s conservative, nationalist agenda and frames Russian military actions—especially in Ukraine—in spiritual terms, thereby granting religious legitimacy to the regime."
});

// Alina Kabaeva
CREATE (kabaeva:Person {
  name: "Alina Kabaeva",
  title: "Chairwoman of National Media Group (former State Duma Deputy)",
  affiliations: "National Media Group; State Duma (former United Russia MP); Olympic gymnastics team (former athlete)",
  career_history: "Olympic champion in rhythmic gymnastics, served as a pro-Kremlin Duma Deputy (2007–2014). Became Chair of National Media Group in 2014.",
  personality_traits: "Former celebrity athlete, now private. Influence linked to rumored personal relationship with Putin.",
  public_statements: "Not politically outspoken. Appears at sports or patriotic events, praising traditional values.",
  relationship_to_putin: "Widely believed to be his romantic partner. Officially unconfirmed, but US sanctions note a 'close relationship'.",
  trust_level: "Presumed extremely high on a personal level. Lacks formal advisory power in security or politics.",
  notable_incidents: "Appointed to head a major media conglomerate. Sanctioned by the West in 2022 for ties to Putin.",
  description: "Alina Kabaeva, an Olympic gold medalist, transitioned into politics and media leadership. Rumored to be Putin’s personal partner, she holds a powerful role at the National Media Group, showcasing the personal dimension of Putin’s inner circle."
});

// Maria Vorontsova
CREATE (vorontsova:Person {
  name: "Maria Vorontsova (Maria Putina)",
  title: "Endocrinologist and Researcher (Putin's elder daughter)",
  affiliations: "National Medical Research Center in Endocrinology; Genetic Research initiatives",
  career_history: "Medical doctor specialized in pediatric endocrinology, involved in large-scale government genetics projects.",
  personality_traits: "Low-profile, academically accomplished, avoids public political involvement.",
  public_statements: "Has not discussed her father publicly. Focuses on scientific research.",
  relationship_to_putin: "Putin’s eldest daughter. He protects her privacy, though she may have indirect policy influence in healthcare/science.",
  trust_level: "High on a personal/familial level. No overt political role.",
  notable_incidents: "Sanctioned by the West for possibly helping shield Putin's wealth. Leads or co-leads certain state-funded medical initiatives.",
  description: "Maria Vorontsova, Putin’s elder daughter, is a pediatric endocrinologist engaged in high-profile genetics research. While carefully shielded from the public sphere, she is believed to be trusted by Putin on sensitive medical and scientific ventures."
});

// Katerina Tikhonova
CREATE (tikhonova:Person {
  name: "Katerina Tikhonova (Ekaterina Putina)",
  title: "Technology Executive (Putin's younger daughter)",
  affiliations: "Innopraktika (foundation); Moscow State University (innovation center)",
  career_history: "Competitive acrobatic rock’n’roll dancer, PhD from Moscow State University. Leads the Innopraktika foundation focusing on AI and innovation.",
  personality_traits: "Private, technocratic approach. Focuses on scientific and entrepreneurial projects.",
  public_statements: "Avoids political statements, concentrates on academic and business forums.",
  relationship_to_putin: "Younger daughter of Putin, benefits from state support for her initiatives. Possibly assists in bridging tech and defense.",
  trust_level: "High personally, with no formal security/political role.",
  notable_incidents: "Sanctioned by the West for alleged ties to state resources and shielding family assets.",
  description: "Katerina Tikhonova, Putin’s younger daughter, oversees Innopraktika, focusing on AI and innovation at Moscow State University. Though not openly political, she is believed to be involved in projects that receive direct Kremlin support, reflecting her privileged access."
});

// Viktor Medvedchuk
CREATE (medvedchuk:Person {
  name: "Viktor Medvedchuk",
  title: "Ukrainian Politician (Putin's close ally in Ukraine)",
  affiliations: "Opposition Platform – For Life party (former leader); Ukrainian government (former Chief of Staff to President Kuchma)",
  career_history: "Ukrainian lawyer and politician, led a pro-Russian opposition party. Known as the Kremlin's closest ally in Kyiv.",
  personality_traits: "Politically savvy, strongly pro-Moscow, oligarchic fixer style.",
  public_statements: "Advocated for Ukraine to abandon NATO/EU ties, supports integration with Russia. Blamed Kyiv for 'forcing' Crimea's annexation.",
  relationship_to_putin: "Personal friend; Putin is godfather to Medvedchuk’s daughter. Key conduit for Russian influence in Ukraine.",
  trust_level: "Previously very high as Kremlin's main proxy, waned after his arrest and Ukraine’s shift away from Russia.",
  notable_incidents: "Treason charges in Ukraine, captured and exchanged in a prisoner swap. Sanctioned by the US for undermining Ukrainian sovereignty.",
  description: "Viktor Medvedchuk, a central pro-Russia figure in Ukraine, has personal ties to Putin (who is godfather to his daughter). Once pivotal in promoting Moscow’s agenda within Ukraine, he was arrested and later swapped in 2022, reflecting his crucial but ultimately fragile role in Putin’s regional ambitions."
});

// Sergei Ivanov
CREATE (ivanov:Person {
  name: "Sergei Ivanov",
  title: "Special Presidential Representative (Former Defense Minister & Chief of Staff)",
  affiliations: "Russian Security Council; KGB (retired officer); Presidential Administration",
  career_history: "KGB veteran from Leningrad, served as Defense Minister (2001–2007) and Deputy Prime Minister. Then Putin’s Chief of Staff (2011–2016). Now a Special Envoy on environmental issues.",
  personality_traits: "Hardline on security, once very powerful, now lower-profile but still loyal.",
  public_statements: "Spoke tough on Western interference in the 2000s. Focuses on environment and transport after 2016.",
  relationship_to_putin: "KGB colleague since Leningrad days, once a top lieutenant. Moved to a special role in 2016 but remains trusted.",
  trust_level: "High, though active influence has diminished. Still sits on Security Council.",
  notable_incidents: "Was considered a potential Putin successor in mid-2000s. Demoted from Chief of Staff in 2016 to special envoy.",
  description: "Sergei Ivanov, a longtime KGB comrade of Putin, served as Defense Minister and later Chief of Staff. Though now in a less central role, he remains a loyal figure within Putin’s inner circle and holds a seat on the Security Council."
});

// STEP 4: Create Organization nodes
CREATE (kgb:Organization {name: "KGB"})
CREATE (fsb:Organization {name: "Federal Security Service (FSB)"})
CREATE (securityCouncil:Organization {name: "Security Council of Russia"})
CREATE (svr:Organization {name: "Foreign Intelligence Service (SVR)"})
CREATE (mod:Organization {name: "Ministry of Defense"})
CREATE (mfa:Organization {name: "Ministry of Foreign Affairs"})
CREATE (gov:Organization {name: "Government of Russia"})
CREATE (presAdmin:Organization {name: "Presidential Administration"})
CREATE (stateDuma:Organization {name: "State Duma"})
CREATE (rosneft:Organization {name: "Rosneft"})
CREATE (gazprom:Organization {name: "Gazprom"})
CREATE (nationalGuard:Organization {name: "National Guard of Russia (Rosgvardiya)"})
CREATE (orthodoxChurch:Organization {name: "Russian Orthodox Church"})
CREATE (mediaGroup:Organization {name: "National Media Group"})
CREATE (smpBank:Organization {name: "SMP Bank"})
CREATE (volgaGroup:Organization {name: "Volga Group"})
CREATE (bankRossiya:Organization {name: "Bank Rossiya"})
CREATE (armedForces:Organization {name: "Russian Armed Forces"})
CREATE (emercom:Organization {name: "Ministry of Emergency Situations (EMERCOM)"})
CREATE (generalStaff:Organization {name: "General Staff"})
CREATE (unitedRussia:Organization {name: "United Russia party"})
CREATE (taxService:Organization {name: "Federal Tax Service"})
CREATE (ozero:Organization {name: "Ozero Dacha Cooperative"})
CREATE (stroygazmontazh:Organization {name: "Stroygazmontazh (SGM)"})
CREATE (innopraktika:Organization {name: "Innopraktika"})
CREATE (msu:Organization {name: "Moscow State University"})
CREATE (endocrinologyCenter:Organization {name: "National Medical Research Center in Endocrinology"})
CREATE (opposition:Organization {name: "Opposition Platform – For Life party"})
CREATE (ukraineGov:Organization {name: "Ukrainian government"})
CREATE (moscowPatriarchate:Organization {name: "Moscow Patriarchate"})
CREATE (gunvor:Organization {name: "Gunvor"})
CREATE (novatek:Organization {name: "Novatek"})
CREATE (presidentialSecurity:Organization {name: "Presidential Security Service"})
CREATE (stPetersburgAdmin:Organization {name: "St. Petersburg City Administration"});

// STEP 5: Create Person-to-Organization relationships

// Nikolai Patrushev
MATCH (p:Person {name: "Nikolai Patrushev"})
MATCH (kgb:Organization {name: "KGB"})
MATCH (fsb:Organization {name: "Federal Security Service (FSB)"})
MATCH (sc:Organization {name: "Security Council of Russia"})
CREATE (p)-[:AFFILIATED_WITH {period: "Career", role: "Officer"}]->(kgb)
CREATE (p)-[:AFFILIATED_WITH {period: "1999-2008", role: "Director"}]->(fsb)
CREATE (p)-[:AFFILIATED_WITH {period: "2008-2024", role: "Secretary"}]->(sc);

// Alexander Bortnikov
MATCH (p:Person {name: "Alexander Bortnikov"})
MATCH (kgb:Organization {name: "KGB"})
MATCH (fsb:Organization {name: "Federal Security Service (FSB)"})
MATCH (sc:Organization {name: "Security Council of Russia"})
CREATE (p)-[:AFFILIATED_WITH {period: "1970s-present", role: "Officer/Director"}]->(fsb)
CREATE (p)-[:AFFILIATED_WITH {period: "Career", role: "Officer"}]->(kgb)
CREATE (p)-[:AFFILIATED_WITH {role: "Member"}]->(sc);

// Sergei Naryshkin
MATCH (p:Person {name: "Sergei Naryshkin"})
MATCH (kgb:Organization {name: "KGB"})
MATCH (svr:Organization {name: "Foreign Intelligence Service (SVR)"})
MATCH (presAdmin:Organization {name: "Presidential Administration"})
MATCH (stateDuma:Organization {name: "State Duma"})
CREATE (p)-[:AFFILIATED_WITH {period: "Career", role: "Officer"}]->(kgb)
CREATE (p)-[:AFFILIATED_WITH {period: "2016-present", role: "Director"}]->(svr)
CREATE (p)-[:AFFILIATED_WITH {period: "Prior", role: "Staff"}]->(presAdmin)
CREATE (p)-[:AFFILIATED_WITH {period: "2011-2016", role: "Chairman"}]->(stateDuma);

// Sergei Shoigu
MATCH (p:Person {name: "Sergei Shoigu"})
MATCH (mod:Organization {name: "Ministry of Defense"})
MATCH (sc:Organization {name: "Security Council of Russia"})
MATCH (emercom:Organization {name: "Ministry of Emergency Situations (EMERCOM)"})
CREATE (p)-[:AFFILIATED_WITH {period: "2012-2024", role: "Minister"}]->(mod)
CREATE (p)-[:AFFILIATED_WITH {period: "2024-present", role: "Secretary"}]->(sc)
CREATE (p)-[:AFFILIATED_WITH {period: "1991-2012", role: "Minister"}]->(emercom);

// Valery Gerasimov
MATCH (p:Person {name: "Valery Gerasimov"})
MATCH (armedForces:Organization {name: "Russian Armed Forces"})
MATCH (generalStaff:Organization {name: "General Staff"})
MATCH (mod:Organization {name: "Ministry of Defense"})
CREATE (p)-[:AFFILIATED_WITH {role: "Chief"}]->(generalStaff)
CREATE (p)-[:AFFILIATED_WITH {role: "Senior Officer"}]->(armedForces)
CREATE (p)-[:AFFILIATED_WITH {role: "First Deputy Minister"}]->(mod);

// Dmitry Medvedev
MATCH (p:Person {name: "Dmitry Medvedev"})
MATCH (sc:Organization {name: "Security Council of Russia"})
MATCH (unitedRussia:Organization {name: "United Russia party"})
MATCH (gov:Organization {name: "Government of Russia"})
CREATE (p)-[:AFFILIATED_WITH {period: "2020-present", role: "Deputy Chairman"}]->(sc)
CREATE (p)-[:AFFILIATED_WITH {role: "Member"}]->(unitedRussia)
CREATE (p)-[:AFFILIATED_WITH {period: "2012-2020", role: "Prime Minister"}]->(gov)
CREATE (p)-[:AFFILIATED_WITH {period: "2008-2012", role: "President"}]->(gov);

// Mikhail Mishustin
MATCH (p:Person {name: "Mikhail Mishustin"})
MATCH (gov:Organization {name: "Government of Russia"})
MATCH (taxService:Organization {name: "Federal Tax Service"})
CREATE (p)-[:AFFILIATED_WITH {period: "2020-present", role: "Prime Minister"}]->(gov)
CREATE (p)-[:AFFILIATED_WITH {period: "2010-2020", role: "Director"}]->(taxService);

// Sergei Lavrov
MATCH (p:Person {name: "Sergei Lavrov"})
MATCH (mfa:Organization {name: "Ministry of Foreign Affairs"})
CREATE (p)-[:AFFILIATED_WITH {period: "2004-present", role: "Minister"}]->(mfa);

// Viktor Zolotov
MATCH (p:Person {name: "Viktor Zolotov"})
MATCH (nationalGuard:Organization {name: "National Guard of Russia (Rosgvardiya)"})
MATCH (kgb:Organization {name: "KGB"})
MATCH (presidentialSecurity:Organization {name: "Presidential Security Service"})
CREATE (p)-[:AFFILIATED_WITH {period: "2016-present", role: "Director"}]->(nationalGuard)
CREATE (p)-[:AFFILIATED_WITH {period: "Early career", role: "Officer"}]->(kgb)
CREATE (p)-[:AFFILIATED_WITH {period: "Prior", role: "Chief"}]->(presidentialSecurity);

// Igor Sechin
MATCH (p:Person {name: "Igor Sechin"})
MATCH (rosneft:Organization {name: "Rosneft"})
MATCH (presAdmin:Organization {name: "Presidential Administration"})
MATCH (gov:Organization {name: "Government of Russia"})
MATCH (kgb:Organization {name: "KGB"})
CREATE (p)-[:AFFILIATED_WITH {period: "2012-present", role: "CEO"}]->(rosneft)
CREATE (p)-[:AFFILIATED_WITH {period: "Early 2000s", role: "Deputy Chief"}]->(presAdmin)
CREATE (p)-[:AFFILIATED_WITH {period: "2008-2012", role: "Deputy Prime Minister"}]->(gov)
CREATE (p)-[:AFFILIATED_WITH {period: "Early career", role: "Associate"}]->(kgb);

// Alexei Miller
MATCH (p:Person {name: "Alexei Miller"})
MATCH (gazprom:Organization {name: "Gazprom"})
MATCH (stPetersburgAdmin:Organization {name: "St. Petersburg City Administration"})
CREATE (p)-[:AFFILIATED_WITH {period: "2001-present", role: "CEO"}]->(gazprom)
CREATE (p)-[:AFFILIATED_WITH {period: "1990s", role: "Official"}]->(stPetersburgAdmin);

// Arkady Rotenberg
MATCH (p:Person {name: "Arkady Rotenberg"})
MATCH (smpBank:Organization {name: "SMP Bank"})
MATCH (stroygazmontazh:Organization {name: "Stroygazmontazh (SGM)"})
CREATE (p)-[:AFFILIATED_WITH {role: "Co-owner"}]->(smpBank)
CREATE (p)-[:AFFILIATED_WITH {role: "Former Owner"}]->(stroygazmontazh);

// Boris Rotenberg
MATCH (p:Person {name: "Boris Rotenberg"})
MATCH (smpBank:Organization {name: "SMP Bank"})
MATCH (stroygazmontazh:Organization {name: "Stroygazmontazh (SGM)"})
CREATE (p)-[:AFFILIATED_WITH {role: "Co-owner"}]->(smpBank)
CREATE (p)-[:AFFILIATED_WITH {role: "Former Co-owner"}]->(stroygazmontazh);

// Gennady Timchenko
MATCH (p:Person {name: "Gennady Timchenko"})
MATCH (volgaGroup:Organization {name: "Volga Group"})
MATCH (gunvor:Organization {name: "Gunvor"})
MATCH (novatek:Organization {name: "Novatek"})
CREATE (p)-[:AFFILIATED_WITH {role: "Owner"}]->(volgaGroup)
CREATE (p)-[:AFFILIATED_WITH {role: "Co-founder, Former"}]->(gunvor)
CREATE (p)-[:AFFILIATED_WITH {role: "Shareholder"}]->(novatek);

// Yury Kovalchuk
MATCH (p:Person {name: "Yury Kovalchuk"})
MATCH (bankRossiya:Organization {name: "Bank Rossiya"})
MATCH (mediaGroup:Organization {name: "National Media Group"})
MATCH (ozero:Organization {name: "Ozero Dacha Cooperative"})
CREATE (p)-[:AFFILIATED_WITH {role: "Major Shareholder"}]->(bankRossiya)
CREATE (p)-[:AFFILIATED_WITH {role: "Controller"}]->(mediaGroup)
CREATE (p)-[:AFFILIATED_WITH {period: "1990s", role: "Member"}]->(ozero);

// Patriarch Kirill
MATCH (p:Person {name: "Patriarch Kirill (Vladimir Gundyayev)"})
MATCH (orthodoxChurch:Organization {name: "Russian Orthodox Church"})
MATCH (moscowPatriarchate:Organization {name: "Moscow Patriarchate"})
CREATE (p)-[:AFFILIATED_WITH {period: "2009-present", role: "Patriarch"}]->(orthodoxChurch)
CREATE (p)-[:AFFILIATED_WITH {role: "Head"}]->(moscowPatriarchate);

// Alina Kabaeva
MATCH (p:Person {name: "Alina Kabaeva"})
MATCH (mediaGroup:Organization {name: "National Media Group"})
MATCH (stateDuma:Organization {name: "State Duma"})
CREATE (p)-[:AFFILIATED_WITH {period: "2014-present", role: "Chairwoman"}]->(mediaGroup)
CREATE (p)-[:AFFILIATED_WITH {period: "2007-2014", role: "Deputy"}]->(stateDuma);

// Maria Vorontsova
MATCH (p:Person {name: "Maria Vorontsova (Maria Putina)"})
MATCH (endocrinologyCenter:Organization {name: "National Medical Research Center in Endocrinology"})
CREATE (p)-[:AFFILIATED_WITH {role: "Researcher"}]->(endocrinologyCenter);

// Katerina Tikhonova
MATCH (p:Person {name: "Katerina Tikhonova (Ekaterina Putina)"})
MATCH (innopraktika:Organization {name: "Innopraktika"})
MATCH (msu:Organization {name: "Moscow State University"})
CREATE (p)-[:AFFILIATED_WITH {role: "Head"}]->(innopraktika)
CREATE (p)-[:AFFILIATED_WITH {role: "Collaborator"}]->(msu);

// Viktor Medvedchuk
MATCH (p:Person {name: "Viktor Medvedchuk"})
MATCH (opposition:Organization {name: "Opposition Platform – For Life party"})
MATCH (ukraineGov:Organization {name: "Ukrainian government"})
CREATE (p)-[:AFFILIATED_WITH {period: "Former", role: "Leader"}]->(opposition)
CREATE (p)-[:AFFILIATED_WITH {period: "2002-2005", role: "Chief of Staff"}]->(ukraineGov);

// Sergei Ivanov
MATCH (p:Person {name: "Sergei Ivanov"})
MATCH (sc:Organization {name: "Security Council of Russia"})
MATCH (kgb:Organization {name: "KGB"})
MATCH (presAdmin:Organization {name: "Presidential Administration"})
MATCH (mod:Organization {name: "Ministry of Defense"})
CREATE (p)-[:AFFILIATED_WITH {role: "Member"}]->(sc)
CREATE (p)-[:AFFILIATED_WITH {period: "Career", role: "Officer"}]->(kgb)
CREATE (p)-[:AFFILIATED_WITH {period: "2011-2016", role: "Chief of Staff"}]->(presAdmin)
CREATE (p)-[:AFFILIATED_WITH {period: "2001-2007", role: "Minister"}]->(mod);

// Putin’s relationships with key organizations
MATCH (p:Person {name: "Vladimir Putin"})
MATCH (kgb:Organization {name: "KGB"})
MATCH (presAdmin:Organization {name: "Presidential Administration"})
MATCH (gov:Organization {name: "Government of Russia"})
MATCH (fsb:Organization {name: "Federal Security Service (FSB)"})
MATCH (stPetersburgAdmin:Organization {name: "St. Petersburg City Administration"})
CREATE (p)-[:AFFILIATED_WITH {period: "Career", role: "Officer"}]->(kgb)
CREATE (p)-[:AFFILIATED_WITH {period: "1996-1997", role: "Deputy Chief"}]->(presAdmin)
CREATE (p)-[:AFFILIATED_WITH {period: "Current", role: "President"}]->(gov)
CREATE (p)-[:AFFILIATED_WITH {period: "1998-1999", role: "Director"}]->(fsb)
CREATE (p)-[:AFFILIATED_WITH {period: "1990s", role: "Official"}]->(stPetersburgAdmin);

// STEP 6: Create relationships from each Person to Putin
MATCH (p:Person)
WHERE p.name <> "Vladimir Putin"
MATCH (putin:Person {name: "Vladimir Putin"})
WITH p, putin
CREATE (p)-[:RELATED_TO {
  relationship_type: CASE
    WHEN p.name IN ["Arkady Rotenberg", "Boris Rotenberg", "Gennady Timchenko", "Yury Kovalchuk"] THEN "Close Friend"
    WHEN p.name IN ["Patriarch Kirill (Vladimir Gundyayev)"] THEN "Ideological Ally"
    WHEN p.name IN ["Viktor Medvedchuk"] THEN "Foreign Ally"
    WHEN p.name IN ["Viktor Zolotov"] THEN "Former Bodyguard"
    WHEN p.name IN ["Maria Vorontsova (Maria Putina)", "Katerina Tikhonova (Ekaterina Putina)"] THEN "Daughter"
    WHEN p.name IN ["Alina Kabaeva"] THEN "Alleged Partner"
    ELSE "Associate"
  END,
  trust_level: p.trust_level,
  details: p.relationship_to_putin
}]->(putin);

// STEP 7: Create inter-person relationships

// KGB Colleagues
MATCH (p1:Person)-[:AFFILIATED_WITH]->(kgb:Organization {name: "KGB"})
MATCH (p2:Person)-[:AFFILIATED_WITH]->(kgb)
WHERE p1 <> p2
CREATE (p1)-[:SHARED_BACKGROUND {organization: "KGB", relationship: "Colleagues"}]->(p2);

// St. Petersburg Administration
MATCH (p1:Person)-[:AFFILIATED_WITH]->(spb:Organization {name: "St. Petersburg City Administration"})
MATCH (p2:Person)-[:AFFILIATED_WITH]->(spb)
WHERE p1 <> p2
CREATE (p1)-[:SHARED_BACKGROUND {organization: "St. Petersburg Administration", relationship: "Colleagues"}]->(p2);

// Rotenberg Brothers
MATCH (p1:Person {name: "Arkady Rotenberg"})
MATCH (p2:Person {name: "Boris Rotenberg"})
CREATE (p1)-[:FAMILY {relationship: "Brother"}]->(p2);

// Putin’s Daughters
MATCH (p1:Person {name: "Maria Vorontsova (Maria Putina)"})
MATCH (p2:Person {name: "Katerina Tikhonova (Ekaterina Putina)"})
CREATE (p1)-[:FAMILY {relationship: "Sister"}]->(p2);

// Security Council Colleagues
MATCH (p1:Person)-[:AFFILIATED_WITH]->(sc:Organization {name: "Security Council of Russia"})
MATCH (p2:Person)-[:AFFILIATED_WITH]->(sc)
WHERE p1 <> p2
CREATE (p1)-[:WORKS_WITH {context: "Security Council", relationship: "Colleagues"}]->(p2);

// Collaboration among Security/Military Agencies
MATCH (p1:Person)-[:AFFILIATED_WITH]->(o1:Organization)
WHERE o1.name IN [
  "Ministry of Defense",
  "Federal Security Service (FSB)",
  "Foreign Intelligence Service (SVR)",
  "National Guard of Russia (Rosgvardiya)"
]
MATCH (p2:Person)-[:AFFILIATED_WITH]->(o2:Organization)
WHERE o2.name IN [
  "Ministry of Defense",
  "Federal Security Service (FSB)",
  "Foreign Intelligence Service (SVR)",
  "National Guard of Russia (Rosgvardiya)"
]
AND p1 <> p2 AND o1 <> o2
CREATE (p1)-[:COLLABORATES {domain: "Security/Military", relationship: "Interagency"}]->(p2);

// Economic relationships
MATCH (p1:Person)-[:AFFILIATED_WITH]->(o1:Organization)
WHERE o1.name IN ["Rosneft", "Gazprom", "SMP Bank", "Bank Rossiya", "Volga Group"]
MATCH (p2:Person)-[:AFFILIATED_WITH]->(o2:Organization)
WHERE o2.name IN ["Rosneft", "Gazprom", "SMP Bank", "Bank Rossiya", "Volga Group"]
AND p1 <> p2 AND o1 <> o2
CREATE (p1)-[:BUSINESS_TIES {sector: "Energy/Finance", relationship: "Partners"}]->(p2);

// STEP 8: Example Queries

// Query 1: Find the people Putin trusts the most
MATCH (p:Person)-[r:RELATED_TO]->(putin:Person {name: "Vladimir Putin"})
WHERE r.trust_level CONTAINS "Extremely high" OR r.trust_level CONTAINS "Very high"
RETURN p.name, p.title, r.trust_level
ORDER BY r.trust_level DESC;

// Query 2: Find all former KGB officers
MATCH (p:Person)-[:AFFILIATED_WITH]->(:Organization {name: "KGB"})
RETURN p.name, p.title;

// Query 3: Find all individuals controlling key economic resources
MATCH (p:Person)-[:AFFILIATED_WITH]->(o:Organization)
WHERE o.name IN ["Rosneft", "Gazprom", "Bank Rossiya", "SMP Bank", "Volga Group"]
RETURN p.name, p.title, o.name AS organization;

// Query 4: Find the most influential security officials
MATCH (p:Person)-[:AFFILIATED_WITH]->(o:Organization)
WHERE o.name IN [
  "Federal Security Service (FSB)",
  "Foreign Intelligence Service (SVR)",
  "Security Council of Russia",
  "Ministry of Defense"
]
MATCH (p)-[r:RELATED_TO]->(putin:Person {name: "Vladimir Putin"})
RETURN p.name, p.title, r.trust_level, collect(o.name) AS security_roles
ORDER BY r.trust_level DESC;

// Query 5: View the network of key organizations and people related to Putin
MATCH path = (o:Organization)<-[:AFFILIATED_WITH]-(p1:Person)-[:RELATED_TO]->(putin:Person {name: "Vladimir Putin"})
WHERE o.name IN ["Federal Security Service (FSB)", "Security Council of Russia", "Rosneft", "Gazprom"]
RETURN path;

// Query 6: Analyze social relationships – find Putin’s social circle
MATCH (p:Person)-[r:RELATED_TO]->(putin:Person {name: "Vladimir Putin"})
WHERE r.relationship_type IN ["Close Friend", "Former Bodyguard", "Daughter", "Alleged Partner"]
RETURN p.name, p.title, r.relationship_type;

// Query 7: Find connections between government and business
MATCH (p:Person)-[:AFFILIATED_WITH]->(g:Organization)
WHERE g.name IN ["Government of Russia", "Presidential Administration", "Ministry of Defense", "Security Council of Russia"]
MATCH (p)-[:AFFILIATED_WITH]->(b:Organization)
WHERE b.name IN ["Rosneft", "Gazprom", "Bank Rossiya", "SMP Bank", "Volga Group"]
RETURN p.name, g.name AS government_role, b.name AS business_connection;

// STEP 9: Generate description embeddings (Optional)
// Make sure you have the appropriate plugin and environment setup for genai.vector.encode.