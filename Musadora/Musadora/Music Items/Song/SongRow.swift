//
//  SongRow.swift
//  Musadora
//
//  Created by Rudrank Riyam on 15/03/23.
//

import SwiftUI
import MusadoraKit

struct SongRow: View {
  var song: Song

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        if let artwork = song.artwork {
          ArtworkImage(artwork, width: 100, height: 100)
            .cornerRadius(8)
        }

        Spacer()

        Image(systemName: "play.fill")
          .foregroundColor(.secondary)
          .onTapGesture {
            Task {
              do {
                try await APlayer.shared.play(song: song)
              } catch {
                print(error)
              }
            }
          }
      }

      Text(song.title)
        .bold()
        .font(.headline)

      Text(song.artistName)
        .font(.subheadline)
    }
    .contentShape(Rectangle())
  }
}
