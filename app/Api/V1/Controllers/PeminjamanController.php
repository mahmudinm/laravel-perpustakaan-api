<?php

namespace App\Api\V1\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Book;
use App\User;
use App\Peminjaman;
use Auth;


class PeminjamanController extends Controller
{
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $peminjamans = Peminjaman::all();
        $peminjamans->load('book');
        $peminjamans->load('user');
        return response()->json($peminjamans);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $users = User::select('name', 'id')->get();
        $books = Book::select('name', 'id')->get();
        return response()->json([$users, $books]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'book_id' => 'required',
            'user_id' => 'required',
            'tgl_pinjam' => 'required',
            'tgl_kembali' => 'required'
        ]);

        // validasi jika stock buku sudah habis
        $stock = Book::find($request->book_id);
        if ($stock->stock <= 0 ) {
            return response()->json('Maaf Stock Buku Habis');
        }

        $peminjaman = new Peminjaman;
        $peminjaman->book_id = $request->book_id;
        $peminjaman->user_id = $request->user_id;
        $peminjaman->tgl_pinjam = $request->tgl_pinjam;
        $peminjaman->tgl_kembali = $request->tgl_kembali;
        $peminjaman->save();

        $book = Book::find($request->book_id);
        $book->stock = $book->stock - 1 ; 
        $book->save();

        return response()->json('success', 201);
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Peminjaman  $peminjaman
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $peminjaman = Peminjaman::find($id);
        $users = User::select('name', 'id')->get();
        $books = Book::select('name', 'id')->get();
        return response()->json([$peminjaman, $users, $books]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Peminjaman  $peminjaman
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'book_id' => 'required',
            'user_id' => 'required',
            'tgl_pinjam' => 'required',
            'tgl_kembali' => 'required'
        ]);

        // validasi jika stock buku sudah habis
        $book = Book::find($request->book_id);
        $peminjaman = Peminjaman::find($id);
        if ($book->stock <= 0 ) {
            return response()->json('stock buku kosong');
        } else {
            // data buku yang ingin di tambah / update
            $book_before = Book::find($peminjaman->book_id);
            $book_before->stock = $book_before->stock + 1;           
            $book_before->save();

            // ada bug ketika update pada buku yang sama hanya akan mengurangi tanpa menambahnya terlebih dahulu
            // data buku yang ingin di kurangi 
            $book->stock = $book->stock - 1;
            $book->save();
        }

        $peminjaman->update($request->all());

        return response()->json('success update', 201);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Peminjaman  $peminjaman
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $peminjaman = Peminjaman::find($id);
        $peminjaman->delete();
        $book = Book::find($peminjaman->book_id);
        $book->stock = $book->stock + 1 ;
        $book->save() ;
        return response()->json('success delete', 201);
    }
}
