require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  scenario "user create a new task" do
    visit tasks_path
    expect {
      click_link '登録'
      fill_in 'Title', with: 'A Task'
      fill_in 'Description', with: 'A simple task'
      click_button '登録'

      expect(page).to have_content '登録完了'
      expect(page).to have_content 'A Task'
      expect(page).to have_content 'A simple task'
    }.to change(Task.all, :count).by(1)
  end

  scenario "user edit a task" do
    Task.create(title: 'A task', description: 'A simple task')
    visit tasks_path

    click_link '編集'
    fill_in 'Title', with: 'B task'
    fill_in 'Description', with: 'B hard task'
    click_button '更新'

    expect(page).to have_content '更新完了'
    expect(page).to have_content 'B task'
    expect(page).to have_content 'B hard task'
  end

  scenario "user delete a task", js: true do
    Task.create(title: 'A task', description: 'A simple task')
    visit tasks_path

    click_link '削除'
    page.accept_confirm

    expect {
      expect(page).to have_content '削除完了'
      expect(page).not_to have_content 'A Task'
      expect(page).not_to have_content 'A simple task'
    }.to change(Task.all, :count).by(-1)
  end
end
