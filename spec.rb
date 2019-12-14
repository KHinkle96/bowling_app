require "rspec"
require "./bowling_score_app"

RSpec.describe "bowling_score_app" do

context "when strike in frame 1" do
    it "score is nil" do
        bowler = Bowler.new
        bowler.roll ("X")
        expect(bowler.score).to eq nil
    end
end

context "when strike in frame 1 & spare in frame 2" do
    it "score is 20" do
        bowler = Bowler.new
        bowler.roll ("X")
        bowler.roll (5, "/")
        expect(bowler.score).to eq 20
end

context "when strike in frame 1 & 5 in frame 2" do
    it "score is 15" do
        bowler = Bowler.new
        bowler.roll ("X")
        bowler.roll (3, 2)
        expect(bowler.score).to eq 15
end

context "when there is a spare in frame 1" do
    it "score is nil" do
        bowler = Bowler.new
        bowler.roll (5, "/")
        expect(bowler.score).to eq nil
end

context "when there is a spare in frame 1 & 5 for the first roll of frame 2" do
    it "score is 15" do
        bowler = Bowler.new
        bowler.roll (5, "/")
        bowler.roll (5, 0)
        expect(bowler.score).to eq 15
end

context "when there is a spare in frame 1 & 0 for the first roll of frame 2" do
    it "score is 10" do
        bowler = Bowler.new
        bowler.roll (5, "/")
        bowler.roll (0, 0)
        expect(bowler.score).to eq 10
end

context "when there's a gutter for every single roll" do
    it "score is 0" do
        bowler = Bowler.new
        bowler.roll (0,0)
        bowler.roll (0,0)
        bowler.roll (0,0)
        bowler.roll (0,0)
        bowler.roll (0,0)
        bowler.roll (0,0)
        bowler.roll (0,0)
        bowler.roll (0,0)
        bowler.roll (0,0)
        bowler.roll (0,0)
        expect(bowler.score).to eq 0
end

context "when there's a strike for every single roll" do
    it "score is 300" do
        bowler = Bowler.new
        bowler.roll ("X")
        bowler.roll ("X")
        bowler.roll ("X")
        bowler.roll ("X")
        bowler.roll ("X")
        bowler.roll ("X")
        bowler.roll ("X")
        bowler.roll ("X")
        bowler.roll ("X")
        bowler.roll ("X")
        expect(bowler.score).to eq 300
end