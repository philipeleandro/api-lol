namespace :champion_data do
  task populate: :environment do
    names = LeagueOfLegendsData.name_champions
    puts "START!!"
    puts "--------------------------------------------"
    names.each do |name|
      champion = Champion.where(name: name)

      if champion.nil?
        if name == 'FiddleSticks'
          champion_name = 'Fiddlesticks'
          champion_info = LeagueOfLegendsData.champion_data(champion_name)['data'][champion_name]

          puts "#{name} - POPULATING "
          Champion.create(id_riot: champion_info['id'],
                        key: champion_info['key'],
                        title: champion_info['title'],
                        image: champion_info['image'],
                        skins: champion_info['skins'],
                        lore: champion_info['lore'],
                        blurb: champion_info['blurb'] ,
                        allytips: champion_info['allytips'],
                        enemytips: champion_info['enemytips'],
                        tags: champion_info['tags'],
                        partype: champion_info['partype'],
                        info: champion_info['info'],
                        stats: champion_info['stats'],
                        spells: champion_info['spells'],
                        passive: champion_info['passive'],
                        recommended: champion_info['recommended'],
                        name: champion_info['name'])
        puts "#{name} - DONE "
        puts "--------------------------------------------"
        else
          champion_info = LeagueOfLegendsData.champion_data(name)['data'][name]

          puts "#{name} - POPULATING "
          Champion.create(id_riot: champion_info['id'],
                        key: champion_info['key'],
                        title: champion_info['title'],
                        image: champion_info['image'],
                        skins: champion_info['skins'],
                        lore: champion_info['lore'],
                        blurb: champion_info['blurb'] ,
                        allytips: champion_info['allytips'],
                        enemytips: champion_info['enemytips'],
                        tags: champion_info['tags'],
                        partype: champion_info['partype'],
                        info: champion_info['info'],
                        stats: champion_info['stats'],
                        spells: champion_info['spells'],
                        passive: champion_info['passive'],
                        recommended: champion_info['recommended'],
                        name: champion_info['name'])
        puts "#{name} - DONE "
        puts "--------------------------------------------"
        end
      elsif champion.size == 1
        champion_info = LeagueOfLegendsData.champion_data(name)['data'][name]
        champion = Champion.find_by(name: name)

          puts "#{name} - UPDATING "
          champion.update(id_riot: champion_info['id'],
                        key: champion_info['key'],
                        title: champion_info['title'],
                        image: champion_info['image'],
                        skins: champion_info['skins'],
                        lore: champion_info['lore'],
                        blurb: champion_info['blurb'] ,
                        allytips: champion_info['allytips'],
                        enemytips: champion_info['enemytips'],
                        tags: champion_info['tags'],
                        partype: champion_info['partype'],
                        info: champion_info['info'],
                        stats: champion_info['stats'],
                        spells: champion_info['spells'],
                        passive: champion_info['passive'],
                        recommended: champion_info['recommended'],
                        name: champion_info['name'])
        puts "#{name} - DONE "
        puts "--------------------------------------------"
      end
    end
    puts "FINISH!!"
    puts "--------------------------------------------"
  end
end
