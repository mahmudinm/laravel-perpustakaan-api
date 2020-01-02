<?php

namespace App\Api\V1\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Book;
use Auth;

class BookController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $books = Book::all();
        return response()->json($books);
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
            'name' => 'required|max:30',
            'description' => 'required|max:100',
            'penerbit' => 'required|max:30',
            'tanggal_terbit' => 'required|date',
            'stock' => 'required|integer'
        ]);

        $book = new Book;
        $book->name = $request->name;
        $book->description = $request->description;
        $book->penerbit = $request->penerbit;
        $book->tanggal_terbit = $request->tanggal_terbit;
        $book->stock = $request->stock;
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
        $book = book::find($id);
        return response()->json($book);
    }    

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Book  $book
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|max:30',
            'description' => 'required|max:100',
            'penerbit' => 'required|max:30',
            'tanggal_terbit' => 'required|date',
            'stock' => 'required|integer'
        ]);

        $book = Book::find($id);
        $book->update($request->all());
        return response()->json('update success', 201);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Book  $book
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // $book->delete();
        $book = Book::find($id);
        $book->delete();
        return response()->json('delete success');
    }
}
