@foreach ($soal['11_18'] as $x => $s)
<input name="umur" type="hidden" value="11_18">
    <div class="col-12 border border-warning rounded" style="margin-top: 20px; padding: 10px; background-color: #f5f2d6">
        <h5>{{ $s }} </h5>
        <div class="form-check">
            @if ($kategori['11_18'][$x] == 'e')
                <input class="form-check-input" type="radio" name="radio_e[{{ $x }}]" value="{{ $nilai_1['11_18'][$x] }}" required>
            @elseif($kategori['11_18'][$x] == 'c')
                <input class="form-check-input" type="radio" name="radio_c[{{ $x }}]" value="{{ $nilai_1['11_18'][$x] }}" required>
            @elseif($kategori['11_18'][$x] == 'h')
                <input class="form-check-input" type="radio" name="radio_h[{{ $x }}]" value="{{ $nilai_1['11_18'][$x] }}" required>
            @elseif($kategori['11_18'][$x] == 'p')
                <input class="form-check-input" type="radio" name="radio_p[{{ $x }}]" value="{{ $nilai_1['11_18'][$x] }}" required>
            @elseif($kategori['11_18'][$x] == 'pro')
                <input class="form-check-input" type="radio" name="radio_pro[{{ $x }}]" value="{{ $nilai_1['11_18'][$x] }}" required>
            @endif
            <label class="form-check-label" for="flexRadioDefault1">
                Tidak Benar
            </label>
        </div>
        <div class="form-check">
            @if ($kategori['11_18'][$x] == 'e')
                <input class="form-check-input" type="radio" name="radio_e[{{ $x }}]" value="{{ $nilai_2['11_18'][$x] }}" required>
            @elseif($kategori['11_18'][$x] == 'c')
                <input class="form-check-input" type="radio" name="radio_c[{{ $x }}]" value="{{ $nilai_2['11_18'][$x] }}" required>
            @elseif($kategori['11_18'][$x] == 'h')
                <input class="form-check-input" type="radio" name="radio_h[{{ $x }}]" value="{{ $nilai_2['11_18'][$x] }}" required>
            @elseif($kategori['11_18'][$x] == 'p')
                <input class="form-check-input" type="radio" name="radio_p[{{ $x }}]" value="{{ $nilai_2['11_18'][$x] }}" required>
            @elseif($kategori['11_18'][$x] == 'pro')
                <input class="form-check-input" type="radio" name="radio_pro[{{ $x }}]" value="{{ $nilai_2['11_18'][$x] }}" required>
            @endif
            <label class="form-check-label" for="flexRadioDefault2">
                Kadang Benar
            </label>
        </div>
        <div class="form-check">
            @if ($kategori['11_18'][$x] == 'e')
                <input class="form-check-input" type="radio" name="radio_e[{{ $x }}]" value="{{ $nilai_3['11_18'][$x] }}" required>
            @elseif($kategori['11_18'][$x] == 'c')
                <input class="form-check-input" type="radio" name="radio_c[{{ $x }}]" value="{{ $nilai_3['11_18'][$x] }}" required>
            @elseif($kategori['11_18'][$x] == 'h')
                <input class="form-check-input" type="radio" name="radio_h[{{ $x }}]" value="{{ $nilai_3['11_18'][$x] }}" required>
            @elseif($kategori['11_18'][$x] == 'p')
                <input class="form-check-input" type="radio" name="radio_p[{{ $x }}]" value="{{ $nilai_3['11_18'][$x] }}" required>
            @elseif($kategori['11_18'][$x] == 'pro')
                <input class="form-check-input" type="radio" name="radio_pro[{{ $x }}]" value="{{ $nilai_3['11_18'][$x] }}" required>
            @endif
            <label class="form-check-label" for="flexRadioDefault2">
                Selalu benar
            </label>
        </div>
    </div>
@endforeach

<div class="d-flex justify-content-center mb-2">
    <button type="submit" class="btn btn-primary mb-2 mt-3" >
        Submit Jawaban
    </button>
</div>