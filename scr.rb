require 'selenium-webdriver'
require 'open_uri_redirections'
require 'open-uri'

def get_images
  # activate selenium-webdriver in chrome

  #Selenium::WebDriver::Chrome::Service.driver_path ='/chromedriver_win32/chromedriver.exe'
  Selenium::WebDriver::Chrome::Service.driver_path='./chromedriver'
  driver = Selenium::WebDriver.for :chrome
  
  #site URL
  driver.navigate.to 'URL'

  # take URL of img
  elements = driver.find_elements(:xpath, '//img[@class="CLASS NAME"]')

  url_arrays=[]
  elements.each do |element|
    url_arrays << element.attribute("src")
  end
  create_images(url_arrays)
end


def create_images(urls)
  urls.each_with_index do |url, i|
    filename = "test#{i}.jpg"
    #write
    open(filename,'w') do |file|
      open(url) do |data|
        file.write(data.read)
      end
    end
  end
end

get_images