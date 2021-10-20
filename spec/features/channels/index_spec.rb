require 'rails_helper'

RSpec.describe 'the channels index page' do
    before :each do 
        @channel_1 = Channel.create(name: 'ABC', cost: 25, spanish: false)
        @channel_2 = Channel.create(name: 'CBS', cost: 20, spanish: true)
        @channel_3 = Channel.create(name: 'NBC', cost: 15, spanish: true)
    end 

    it 'shows a list of all channels' do
        visit "/channels"

        expect(current_path).to eq('/channels')
        expect(page).to have_content(@channel_1.name)
        expect(page).to have_content(@channel_2.name)
        expect(page).to have_content(@channel_3.name)
    end 

    it 'links to each channels show page' do
        visit "/channels"

        click_on @channel_1.name

        expect(current_path).to eq("/channels/#{@channel_1.id}")
    end 

    it 'should display channels in order of creation date descending' do 
        visit "/channels"
        expect(@channel_3.name).to appear_before(@channel_2.name)
    #    expect(@channel_2).to appear_before(@channel_1)
    end 

    it 'should have a link to create a new channel' do 
        visit "/channels"

        click_link "New Channel"

        expect(current_path).to eq('/channels/new')
        
        fill_in "Name", with: 'PBS'
        fill_in "Cost", with: 1
        choose 'Available in Spanish'

        click_button "Create Channel"

        expect(current_path).to eq('/channels')
        expect(page).to have_content('PBS')
    end 

    it 'should have a link to edit each channel' do
        visit "/channels"

        expect(page).to have_link("Edit #{@channel_1.name}")
        expect(page).to have_link("Edit #{@channel_2.name}") 
        expect(page).to have_link("Edit #{@channel_3.name}") 

        click_link ("Edit #{@channel_1.name}")

        expect(current_path).to eq("/channels/#{@channel_1.id}/edit")

        fill_in "Name", with: 'ESPN'
        fill_in "Cost", with: 100
        choose "Available in Spanish"
        click_button "Submit Changes"

        expect(current_path).to eq("/channels/#{@channel_1.id}")

        expect(page).to have_content('ESPN')
        expect(page).to have_content('100')
        expect(page).to have_content('true')
    end 

    it 'has a link to delete a channel' do 
        channel_9 = Channel.create!(name: 'ABC', cost: 27, spanish: true)
        channel_10 = Channel.create!(name: 'FOX', cost: 25, spanish: true)
        visit "/channels"

        click_link("Delete FOX")

        expect(current_path).to eq("/channels")
        expect(page).not_to have_content(channel_10.name)
    end 
end 