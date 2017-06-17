require 'net/http'
require 'json'
require 'rubygems'
require 'rest-client'
require 'dotenv/load'

def photography(type)
    results = RestClient.get("https://api.gettyimages.com/v3/search/images/creative?phrase=#{type}", headers={"Api-Key":ENV["api_key"]})
    
    # http://www.gettyimages.com/photos/portrait?family=creative&phrase=portrait&excludenudity=true&sort=best#license
    
    # http://www.gettyimages.com/photos/cat?phrase=cat&excludenudity=true&sort=best#license
    
    
    parse_results = JSON.parse(results)
    sample_results = parse_results["images"].sample(12)
    six_images = []
    sample_results.each do |image|
        six_images.push(image["display_sizes"][0]["uri"])
    end
    six_images
    
end
puts photography("display_set")
# OMG IM GOIGN TO DIE OML OK THIS IS WHERE CODE STARTS --- NaYNa
# def music(genre)
#     token_request = RestClient::Request.execute(method: :post, 
#     url:"https://api.vimeo.com/oauth/authorize/client",
#     payload:{grant_type: "client_credentials"},
#     user: ENV["vimeo_api_key"], 
#     password: ENV["vimeo_api_pass"])
    
#     token = JSON.parse(token_request)["access_token"]
    
#     results = RestClient::Request.execute(method: :get, url: "https://api.vimeo.com/categories/musicvideos/videos?query=#{genre.gsub(" ", "+")}+music", timeout: 10, headers: {"Authorization" => "Bearer #{token}"})
#         video_results = JSON.parse(results)
#         video_results["data"][0]["embed"]["html"]
        
# end

# p music("beyonce")

def music_playlists(genre)
    playlist_genres = {
        :classical => ["https://open.spotify.com/embed/user/steelo__407/playlist/5tXCRZAUKp2uqtmJZNkQxY","https://www.youtube.com/embed/P2l0lbn5TVg?list=PL2788304DC59DBEB4", "https://open.spotify.com/embed/user/maddiefostef/playlist/4tLTts7eIkvou7Xh9Td3s1"],
         
        :pop => ["https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DWUa8ZRTfalHk","https://www.youtube.com/embed/FM7MFYoylVs?list=RDQMidJewm0VheQ", "https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DX6aTaZa0K6VA"],

          :rNb => ["https://open.spotify.com/embed/user/digster.co.uk/playlist/638cn2WMZea3FRuYPjsf3R","https://www.youtube.com/embed/lXd1GHJPx-A?list=PLFbWuc6jwPGeqFkoDBq87CcmlurwrlEGv", "https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DX2WkIBRaChxW"],

          :blues => ["https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DXbkKnGZHv1kf","https://www.youtube.com/embed/fQMU1S8FhKg?list=PLjzeyhEA84sQKuXp-rpM1dFuL2aQM_a3S", "https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DWSKpvyAAcaNZ"],

          :jazz => ["https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DX0SM0LYsmbMT","https://www.youtube.com/embed/3BgvoQzmhIM?list=PLRZlMhcYkA2G3kufxNpDwFN64jmNUmjt6","https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DXbITWG1ZJKYt"],

          :rap_or_hiphop => ["https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DX0XUsuxWHRQd","https://www.youtube.com/embed/Zgmvg-zzctI?list=PLuUrokoVSxlfB8EIhy6Jdi9_aszGD5Grb", "https://open.spotify.com/embed/user/filtr/playlist/5zW7oFoZb0nZYJmQagegpQ"],

          :rock => ["https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DXcF6B6QPhFDv","https://www.youtube.com/embed/129kuDCQtHs?list=PLSK7WJ2x0vp1kY9CdiuA5fAB-ZN21hIeH", "https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DX49jUV2NfGku"],

          :reggae => ["https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DXbSbnqxMTGx9","https://www.youtube.com/embed/51RGyVHXrIs", "https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DWXOFzblTbKAU"],

          :punk_rock => ["https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DX0BZrbvIqxCd","https://www.youtube.com/embed/emGri7i8Y2Y?list=PL-aQd8Gsz8xcsUrW5t5bP7I2nfHoy42sP", "https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DWU0FBqUeZYeN"],

          :country => ["https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DWYnwbYQ5HnZU", "https://www.youtube.com/embed/Fx-EfjsRcBk?list=PL6Go6XFhidED5RmiuRdks87fyOvlXqn14", "https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DWXi7h4mmmkzD"],

          :alternative => ["https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DWSfMe9z89s9B","https://www.youtube.com/embed/7wtfhZwyrcc?list=RDQMPeNPa8cjuMw", "https://open.spotify.com/embed/user/aarushimac/playlist/6t0SCMW50gpP7G1BgammjJ"],

          :dance_electronic => ["https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DX4dyzvuaRJ0n", "https://www.youtube.com/embed/papuvlVeZg8?list=PLw-VjHDlEOgvvecEeS-BC-qFhweKjZJ2I" , "https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DXcZDD7cfEKhW"],

          :funk => ["https://open.spotify.com/embed/user/redmusiccompany/playlist/0WrqPR7s1X73LBJiW2eRWC","https://www.youtube.com/embed/rrBx6mAWYPU?list=RDQMy4c8aRKCMis", "https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DX6drTZKzZwSo"],

          :gospel => ["https://open.spotify.com/embed/user/1282259153/playlist/6Kp7piM2oRntlF6RPjpdM9","https://www.youtube.com/embed/U8wOTV1vktw?list=PLbIwq6HuKrKw9-c63LJcynWeuJ6IjxOpx", "https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DX7OIddoQVdRt"],

          :bluegrass => ["https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DXa2HpTqP3clz","https://www.youtube.com/embed/e4Ao-iNPPUc?list=PL8_dTB6oesMruA7K5euPXgo-A4M7XgH7Y", "https://open.spotify.com/embed/user/1258178990/playlist/1xW8uCkRgvpnSWub1GMvCC"],

          :indie => ["https://open.spotify.com/embed/user/1258178990/playlist/1xW8uCkRgvpnSWub1GMvCC", "https://www.youtube.com/embed/hefh9dFnChY", "https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DWWEcRhUVtL8n"],

          :latino => ["https://open.spotify.com/embed/user/mejoresplaylistsspotify/playlist/1vIZxBcvgGHE9HXbQnzXYI", "https://www.youtube.com/embed/kJQP7kiw5Fk?list=RDQMayEPdVDcFFA", "https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DX10zKzsJ2jva"],

          :christian => ["https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DWUUPO0Sbx2CM", "https://www.youtube.com/embed/nQWFzMvCfLE?list=PLWvahZRxLnLMSWeULnub0CCeQzvxGM8hB","https://open.spotify.com/embed/user/spotify/playlist/37i9dQZF1DX5SzTPIoCKiv"]

    }
    return playlist_genres[genre]
end
