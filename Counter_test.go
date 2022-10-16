package main

import "testing"

func TestCounter(t *testing.T) {
	type args struct {
		input string
	}
	tests := []struct {
		name       string
		args       args
		wantOutput string
	}{
		// TODO: Add test cases.
		{"test1", args{input: "aaabbbccccc"}, "a3b3c5"},
		{"test2", args{input: "zzzzcccUUUuu"}, "U3c3u2z4"},
		{"test3", args{input: "ЯЯЯБББддд"}, "Б3Я3д3"},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if gotOutput := Counter(tt.args.input); gotOutput != tt.wantOutput {
				t.Errorf("Counter() = %v, want %v", gotOutput, tt.wantOutput)
			}
		})
	}
}
